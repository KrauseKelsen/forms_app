import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.deepPurple,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected colors must be greater than 0'),
      assert(selectedColor < colorList.length, 'Selected colors must be greater than ${colorList.length - 1}');

  ThemeData getTheme() =>
      ThemeData(
        useMaterial3: true, 
        colorSchemeSeed: colorList[selectedColor], 
        listTileTheme: ListTileThemeData(iconColor: colorList[selectedColor],)
      );
}