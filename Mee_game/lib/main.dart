import 'package:flutter/material.dart';
import 'package:quiz_game/onboarding.dart';

void main() => runApp(const MyQuizApp());

class MyQuizApp extends StatelessWidget {
  const MyQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const Onboarding(),
    );
  }
}
