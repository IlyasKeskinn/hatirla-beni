import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get theme => ThemeData.dark().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
}
