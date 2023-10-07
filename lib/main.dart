import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/audio_provider.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:flutter_application_1/providers/translation_provider.dart';
import 'package:flutter_application_1/screens/flutter_challenge.dart';
import 'package:flutter_application_1/themes/dark_theme.dart';
import 'package:flutter_application_1/themes/light_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application_1/translations/codegen_loader.g.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => TranslationProvider()),
          ChangeNotifierProvider(create: (context) => AudioProvider()),
        ],
        child: Consumer<ThemeProvider>(builder: (context, provider, child) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const FlutterChallenge(),
            theme: ThemeProvider.isDark ? darkTheme : lightTheme,
            debugShowCheckedModeBanner: false,
          );
        }));
  }
}
