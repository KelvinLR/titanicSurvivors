import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BadEndingScreen extends StatelessWidget {
  const BadEndingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.pop(context);
      },
      child: const RiveAnimation.asset(
        'assets/rive/bad_ending.riv',
        animations: ['Example'],
        fit: BoxFit.fill,
      ),
    );
  }
}
