part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;

  ChangeThemeEvent(this.themeMode);
}
