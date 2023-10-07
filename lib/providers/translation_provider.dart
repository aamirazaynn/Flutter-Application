import 'package:flutter/material.dart';

class TranslationProvider extends ChangeNotifier {
  static bool isArabic = false;
  void toggle(){
    isArabic = !isArabic;
    notifyListeners();
  }
}
