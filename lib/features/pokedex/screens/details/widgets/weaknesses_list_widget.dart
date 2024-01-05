import 'package:flutter/material.dart';

class WeaknessesListWidget extends StatelessWidget {
  const WeaknessesListWidget({super.key, required this.weaknesses});
  final String weaknesses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            weaknesses,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ),
      ),
    );
  }
}
