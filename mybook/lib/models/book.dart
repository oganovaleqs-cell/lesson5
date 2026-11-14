enum Genre { All, Novel, Story, Fantasy, Poetry }

class Book {
  final String id;
  final String title;
  final String author;
  final Genre genre;
  bool isRead;
  int rating;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    this.isRead = false,
    this.rating = 0,
  });
}