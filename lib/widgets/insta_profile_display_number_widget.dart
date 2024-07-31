import 'package:flutter/material.dart';

class InstaProfileDisplayNumber extends StatelessWidget {
  final String count;
  final String label;
  const InstaProfileDisplayNumber(
      {super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900),
        ),
        Text(
          label,
          style: const TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
