import 'package:flutter/material.dart';
import '../models/book.dart';
import 'star_rating.dart';

class BookTile extends StatelessWidget {
  final Book book;
  final ValueChanged<bool?> onToggleRead;
  final VoidCallback onTap;

  const BookTile({
    super.key,
    required this.book,
    required this.onToggleRead,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Checkbox(
        value: book.isRead,
        onChanged: onToggleRead,
      ),
      title: Text(
        book.title,
        style: TextStyle(
          decoration: book.isRead ? TextDecoration.lineThrough : null,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(book.author),
          if (book.rating > 0) StarRating(rating: book.rating),
        ],
      ),
    );
  }
}