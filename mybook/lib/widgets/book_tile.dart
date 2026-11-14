import 'package:flutter/material.dart';
import '../models/book.dart';

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
          if (book.rating > 0)
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < book.rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}