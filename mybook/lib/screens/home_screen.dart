import 'package:flutter/material.dart';
import '../data/books_data.dart';
import '../models/book.dart';
import '../widgets/book_tile.dart';
import 'book_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Book> _books = buildInitialBooks();
  final TextEditingController _searchController = TextEditingController();
  Genre? _selectedGenre;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  int get _readCount => _books.where((b) => b.isRead).length;
  List<Book> get _filteredBooks {
    final query = _searchController.text.toLowerCase();
    return _books.where((book) {
      final matchesSearch = book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      final matchesGenre =
          _selectedGenre == null || book.genre == _selectedGenre;
      return matchesSearch && matchesGenre;
    }).toList();
  }

  void _deleteBook(Book book, int index) {
    setState(() {
      _books.remove(book);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${book.title}-ն ջնջվել է'),
        action: SnackBarAction(
          label: 'Վերականգնել',
          onPressed: () {
            setState(() {
              _books.insert(index, book);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _filteredBooks;

    return Scaffold(
      appBar: AppBar(
        title: Text('Կարդացված: $_readCount / ${_books.length}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Որոնում ըստ անվան կամ հեղինակի...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                          });
                        },
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: const Text('Բոլորը'),
                    selected: _selectedGenre == null,
                    onSelected: (_) => setState(() => _selectedGenre = null),
                  ),
                ),
                ...Genre.values.map((genre) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(genre.label),
                      selected: _selectedGenre == genre,
                      onSelected: (_) =>
                          setState(() => _selectedGenre = genre),
                    ),
                  );
                }),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: filteredList.isEmpty
                ? const Center(child: Text('Ոչինչ չի գտնվել'))
                : ListView.separated(
                    itemCount: filteredList.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final book = filteredList[index];
                      return Dismissible(
                        key: Key(book.id),
                        background: Container(color: Colors.red),
                        onDismissed: (_) {
                          final originalIndex = _books.indexOf(book);
                          _deleteBook(book, originalIndex);
                        },
                        child: BookTile(
                          book: book,
                          onToggleRead: (val) {
                            setState(() {
                              book.isRead = val ?? false;
                            });
                          },
                          onTap: () async {
                            final newRating = await Navigator.push<int>(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookDetailsScreen(book: book),
                              ),
                            );
                            if (newRating != null && newRating > 0) {
                              setState(() {
                                book.rating = newRating;
                                book.isRead = true;
                              });
                            }
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}