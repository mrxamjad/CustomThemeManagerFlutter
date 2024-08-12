import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/bloc/bloc/theme_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context
                    .read<ThemeBloc>()
                    .add(ChangeThemeEvent(ThemeMode.light));
              },
              child: const Text('Light Theme'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeBloc>().add(ChangeThemeEvent(ThemeMode.dark));
              },
              child: const Text('Dark Theme'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context
                    .read<ThemeBloc>()
                    .add(ChangeThemeEvent(ThemeMode.system));
              },
              child: const Text('System Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
