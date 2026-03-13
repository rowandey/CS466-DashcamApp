import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // use system theme for light/dark
  ThemeMode themeMode = ThemeMode.system;

  bool recordingOn = false;

  Color seedColor = const Color.fromARGB(255, 45, 78, 148);
  Color recordButtonColor = Color.fromARGB(255, 100, 100, 100);

  void toggleRecordingButtonColor() {
    recordingOn = !recordingOn;
    recordButtonColor = recordingOn ? Color.fromARGB(255, 255, 0, 0) : Color.fromARGB(255, 100, 100, 100);
    notifyListeners();
  }

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
