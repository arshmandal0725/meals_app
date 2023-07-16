import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  const TextIcon({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 5,
        ),
        Text(label, style: const TextStyle(color: Colors.white))
      ],
    );
  }
}
