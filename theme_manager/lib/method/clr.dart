import 'package:flutter/material.dart';

class Clr {
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color red = Colors.red;
  static Color green = Colors.green;
  static Color blue = Colors.blue;
  static Color yellow = Colors.yellow;
  static Color orange = Colors.orange;
  static Color purple = Colors.purple;
  static Color pink = Colors.pink;
  static Color brown = Colors.brown;
  static Color grey = Colors.grey;

  static changeThemeColor(CustomTheme theme) {
    if (theme == CustomTheme.light) {
      white = Colors.white;
      black = Colors.black;
      red = Colors.red;
      green = Colors.green;
      blue = Colors.blue;
      yellow = Colors.yellow;
      orange = Colors.orange;
      purple = Colors.purple;
      pink = Colors.pink;
      brown = Colors.brown;
      grey = Colors.grey;
    } else if (theme == CustomTheme.dark) {
      white = Colors.black;
      black = Colors.white;
      red = Colors.green;
      green = Colors.red;
      blue = Colors.yellow;
      yellow = Colors.blue;
      orange = Colors.purple;
      purple = Colors.orange;
      pink = Colors.brown;
      brown = Colors.pink;
      grey = Colors.grey;
    }
  }
}

enum CustomTheme { light, dark, arial }
