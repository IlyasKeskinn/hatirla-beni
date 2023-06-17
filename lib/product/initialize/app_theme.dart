import 'package:flutter/material.dart';
import 'package:hatirla_beni/product/constants/color_const.dart';

class AppTheme {
  ThemeData get theme => ThemeData.dark().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        appBarTheme: const AppBarTheme(
            elevation: 0, color: Colors.transparent, centerTitle: true),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(ColorConst.purple),
        )),
      );
}
