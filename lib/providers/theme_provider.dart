import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  static bool isDark = false;
  void toggle(){
    isDark = !isDark;
    notifyListeners();
  }
}
