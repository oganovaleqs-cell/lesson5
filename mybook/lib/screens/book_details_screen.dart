import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/star_rating.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;

  const BookDetailsScreen({super.key, required this.book});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late int _selectedRating;

  @override
  void initState() {
    super.initState();
    _selectedRating = widget.book.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Հեղինակ: ${widget.book.author}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text('Գնահատական (1–5):'),
            StarRating(
              rating: _selectedRating,
              size: 32,
              onChanged: (value) => setState(() => _selectedRating = value),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _selectedRating == 0
                  ? null
                  : () => Navigator.pop(context, _selectedRating),
              child: const Text('Պահպանել'),
            ),
          ],
        ),
      ),
    );
  }
}