import 'package:flutter/material.dart';
import '../models/book.dart';

class DetailsScreen extends StatefulWidget {
  final Book book;

  const DetailsScreen({super.key, required this.book});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _selectedRating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedRating = index + 1;
                    });
                  },
                );
              }),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _selectedRating);
              },
              child: const Text('Պահպանել'),
            ),
          ],
        ),
      ),
    );
  }
}