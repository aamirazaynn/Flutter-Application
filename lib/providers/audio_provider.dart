import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  static bool isPlayed = false;
  void toggle(){
    isPlayed = !isPlayed;
    notifyListeners();
  }
}
