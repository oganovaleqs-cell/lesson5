import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final double size;
  final ValueChanged<int>? onChanged;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 16,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final icon = Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: size,
        );
        if (onChanged == null) return icon;
        return IconButton(
          icon: icon,
          onPressed: () => onChanged!(index + 1),
        );
      }),
    );
  }
}