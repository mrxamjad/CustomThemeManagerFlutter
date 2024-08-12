import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/bloc/bloc/theme_bloc.dart';
import 'package:theme_manager/method/change_theme.dart';
import 'package:theme_manager/method/clr.dart';
import 'package:theme_manager/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text(
                  'Current Theme: ${AppTheme.themeMode}',
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  color: !AppTheme.isDarkMode ? Colors.black : Colors.white,
                  child: Text(
                    'AppTheme.isDarkMode: ${AppTheme.isDarkMode}',
                    style: TextStyle(
                      color: AppTheme.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Clr.red,
                  child: Text('Red'),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Clr.green,
                  child: Text('Green'),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Clr.yellow,
                  child: Text('Yellow'),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Clr.blue,
                  child: Text('Blue'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
              child: Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
