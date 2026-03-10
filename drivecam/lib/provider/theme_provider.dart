import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // use system theme for light/dark
  ThemeMode themeMode = ThemeMode.system;

  Color seedColor = Colors.red;

  void setSeedColor(Color color) {
    seedColor = color;
    notifyListeners();
  }

  void loadDarkModePrefs() async {
    // load in saved preferences
    final prefs = SharedPreferencesAsync();
    bool? mode = await prefs.getBool("darkMode");
    if (mode != null) {
      setDarkMode(mode);
    }
  }

  void setDarkMode(bool mode) async {
    themeMode = mode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    // save preferences to device
    final prefs = SharedPreferencesAsync();
    await prefs.setBool("darkMode", mode);
  }
}
