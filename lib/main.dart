import 'package:flutter/material.dart';
import 'input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: createCustomSwatch(Color(0xFF0A0E21)),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        //accentColor: Colors.purple,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}


// Create a custom MaterialColor using a single color
MaterialColor createCustomSwatch(Color color) {
  List<int> shades = [
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
  ];
  Map<int, Color> swatch = {};
  for (int i = 0; i < shades.length; i++) {
    final int shade = shades[i];
    swatch[shade] = color.withOpacity(1.0);
  }

  return MaterialColor(color.value, swatch);
}


