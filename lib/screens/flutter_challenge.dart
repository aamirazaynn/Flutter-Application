import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application_1/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/translation_provider.dart';
import 'home.dart';
import 'more.dart';

class FlutterChallenge extends StatefulWidget {
  const FlutterChallenge({super.key});

  @override
  State<FlutterChallenge> createState() => _FlutterChallengeState();
}

class _FlutterChallengeState extends State<FlutterChallenge> {
  int currentIndex = 0;
  final screens = [
    const Home(),
    const More(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<TranslationProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: const Color.fromARGB(255, 79, 0, 140),
          unselectedItemColor: const Color.fromARGB(191, 29, 37, 45),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(
                  AssetImage("assets/images/Home_noselection.png")),
              label: LocaleKeys.home.tr(),
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                  AssetImage("assets/images/More_notselected.png")),
              label: LocaleKeys.more.tr(),
            ),
          ],
        ),
      );
    });
  }
}
