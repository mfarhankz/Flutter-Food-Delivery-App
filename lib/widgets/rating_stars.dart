import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  RatingStar(this.rating);
  final int rating;

  @override
  Widget build(BuildContext context) {
    String starts = '';
    for (int i = 0; i < rating; i++) {
      starts += '⭐  ';
    }
    starts.trim();
    return Text(
      starts,
      style: const TextStyle(
        fontSize: 18.0,
      ),
    );
  }
}
