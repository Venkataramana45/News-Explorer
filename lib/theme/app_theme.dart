import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.grey[200],
    textTheme: TextTheme(
      headlineMedium: TextStyle(color: Colors.black, fontSize: 20),
      bodySmall: TextStyle(color: Colors.black87),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.grey[900],
    textTheme: TextTheme(
      headlineMedium: TextStyle(color: Colors.white, fontSize: 20),
      bodySmall: TextStyle(color: Colors.white70),
    ),
  );
}
