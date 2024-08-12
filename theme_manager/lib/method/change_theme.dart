import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_manager/method/clr.dart';

class AppTheme {
  static ThemeMode themeMode = ThemeMode.system;

  static bool isDarkMode = false;
  static bool isLightMode = false;

  static void changeTheme(ThemeMode mode) async {
    themeMode = mode;

    await updateThemePref(mode);

    if (mode == ThemeMode.light) {
      Clr.changeThemeColor(CustomTheme.light);
    } else if (mode == ThemeMode.dark) {
      Clr.changeThemeColor(CustomTheme.dark);
    } else {
      Brightness currentBrithness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;

      if (currentBrithness == Brightness.dark) {
        Clr.changeThemeColor(CustomTheme.dark);
      } else if (currentBrithness == Brightness.light) {
        Clr.changeThemeColor(CustomTheme.light);
      }
    }

    ThemeMode checkThemePref = await getThemePref();
    print('Checking Theme pred------------------------>: $checkThemePref');
  }

  static Future<void> updateThemePref(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', themeMode.toString());
  }

  static Future<ThemeMode> getThemePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString('theme') ?? 'ThemeMode.system';
    print('-------------------------------->Prefenrecse Theme: $theme');
    return theme == 'ThemeMode.system'
        ? ThemeMode.system
        : theme == 'ThemeMode.light'
            ? ThemeMode.light
            : ThemeMode.dark;
  }
}
