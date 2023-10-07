// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "app": "هذا تطبيق",
    "top_likes": "أعلى الاعجابات",
    "sample_text": "عينة",
    "play_this": "شغّل هذا",
    "home": "الصفحة الرئيسية",
    "more": "المزيد",
    "settings": "الإعدادات",
    "dark_mode": "وضع الظلام",
    "arabic_language": "اللغة العربية"
  };
  static const Map<String, dynamic> en = {
    "app": "This is App",
    "top_likes": "Top Likes",
    "sample_text1": "Sample Text",
    "play_this": "Play This",
    "home": "Home",
    "more": "More",
    "settings": "Settings",
    "dark_mode": "Dark mode",
    "arabic_language": "Arabic Language"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en
  };
}
