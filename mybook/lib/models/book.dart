enum Genre {
  novel('Վեպ'),
  story('Պատմվածք'),
  fantasy('Ֆանտաստիկա'),
  poetry('Պոեզիա');

  final String label;
  const Genre(this.label);
}

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