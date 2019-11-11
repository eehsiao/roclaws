import "package:flutter/material.dart";

enum AppTheme {
  BlueLight,
  BlackDark,
}

final appLightThemeData = {
  AppTheme.BlueLight: ThemeData(
    brightness:Brightness.light,
    primarySwatch: Colors.blue,
  ),
  AppTheme.BlackDark: ThemeData(
    brightness:Brightness.dark,
    primarySwatch: Colors.blue,
  ),
};