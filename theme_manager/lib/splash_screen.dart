import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/bloc/bloc/theme_bloc.dart';
import 'package:theme_manager/first_screen.dart';
import 'package:theme_manager/method/change_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  ThemeMode? _themeMode;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await AppTheme.getThemePref().then((value) {
        setState(() {
          _themeMode = value;
          AppTheme.themeMode = value;
          BlocProvider.of<ThemeBloc>(context)
              .add(ChangeThemeEvent(AppTheme.themeMode));
        });
      });

      print(
          "Fetching theme on Init State------------------------->$_themeMode");
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangePlatformBrightness() async {
    Brightness currentBrithness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    if (AppTheme.themeMode == ThemeMode.system) {
      BlocProvider.of<ThemeBloc>(context)
          .add(ChangeThemeEvent(ThemeMode.system));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Management Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstScreen()));
              },
              child: const Text('First Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
