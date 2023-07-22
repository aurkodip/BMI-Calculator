import 'package:flutter/material.dart';
import 'package:bmical/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF081F40),
        scaffoldBackgroundColor: const Color(0xFF0A192F),
      ),
      home: const InputPage(),
    );
  }
}



