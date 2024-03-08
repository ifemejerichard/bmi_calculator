import 'package:flutter/material.dart';
import 'package:bmi_calculator/Input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith( // the copywith means give us a default dark theme but also give us the ability to tweak what ever we want.
        useMaterial3: true,
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Color(0xFF080B1A),
        )
      ),
      home: const InputPage(),
    );
  }
}

// colorScheme: ColorScheme.fromSeed(
// seedColor: Color(0xFF0A0E21),
// ),