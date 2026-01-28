import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final dynamic book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 50,
      height: 100,
    );
  }
}