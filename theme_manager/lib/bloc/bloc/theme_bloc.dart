import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:theme_manager/method/change_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeDark()) {
    on<ThemeEvent>((event, emit) {
      if (event is ChangeThemeEvent) {
        if (event.themeMode == ThemeMode.light) {
          AppTheme.changeTheme(ThemeMode.light);
          AppTheme.isLightMode = true;
          AppTheme.isDarkMode = false;
          emit(ThemeLight());
        } else if (event.themeMode == ThemeMode.dark) {
          AppTheme.changeTheme(ThemeMode.dark);
          AppTheme.isDarkMode = true;
          AppTheme.isLightMode = false;
          emit(ThemeDark());
        } else {
          AppTheme.changeTheme(ThemeMode.system);

          if (WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark) {
            AppTheme.isDarkMode = true;
            AppTheme.isLightMode = false;
            emit(ThemeDark());
          } else {
            AppTheme.isLightMode = true;
            AppTheme.isDarkMode = false;
            emit(ThemeLight());
          }
        }
      }
    });
  }
}
