import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class GoodEndingScreen extends StatelessWidget {
  const GoodEndingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.pop(context);
      },
      child: const RiveAnimation.asset(
        'assets/rive/good_ending.riv',
        fit: BoxFit.fill,
      ),
    );
  }
}
