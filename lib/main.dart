import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/results.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/calculate': (context) => ResultsPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff6f5f5),
        primaryColor: Color(0xff1687a7),
      ),
    );
  }
}
