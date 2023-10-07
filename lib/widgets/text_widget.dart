import 'package:flutter/material.dart';

class Text_Widget extends StatelessWidget {
  String text;
  Text_Widget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 15, bottom: 5, right: 15),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
