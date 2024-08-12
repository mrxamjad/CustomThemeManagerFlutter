import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/bloc/bloc/theme_bloc.dart';
import 'package:theme_manager/method/change_theme.dart';
import 'package:theme_manager/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    // print("Theme in Build _themeMode------------------------->$_themeMode");
    print(
        "Theme in Build AppTheme.themeMode------------------------->$AppTheme.themeMode");
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is ThemeLight) {
            print("Theme in Build state------------------------->Light");
          } else if (state is ThemeDark) {
            print("Theme in Build state------------------------->Dark");
          }

          return MaterialApp(
            title: 'Theme Management Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: AppTheme.themeMode,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
