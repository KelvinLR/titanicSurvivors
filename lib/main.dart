import 'package:flutter/material.dart';
import 'package:titanic_app/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titanic Survivor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Quicksand",
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
