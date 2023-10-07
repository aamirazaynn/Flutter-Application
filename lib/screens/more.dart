import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:flutter_application_1/providers/translation_provider.dart';
import 'package:flutter_application_1/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application_1/translations/locale_keys.g.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TranslationProvider>(builder: (context, p, child) {
      return Consumer<ThemeProvider>(builder: (context, provider, child) {
        bool isDark = ThemeProvider.isDark;
        bool isArabic = TranslationProvider.isArabic;
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.more.tr(),
                style: TextStyle(
                    color: ThemeProvider.isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: ThemeProvider.isDark
                ? const Color.fromARGB(255, 94, 94, 94)
                : Colors.white,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text_Widget(text: LocaleKeys.more.tr()),
              const Divider(),
              ListTile(
                  title: Text(
                    LocaleKeys.dark_mode.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: CupertinoSwitch(
                    value: isDark,
                    onChanged: (value) {
                      setState(() {
                        isDark = value;
                        provider.toggle();
                      });
                    },
                    activeColor: const Color.fromARGB(255, 79, 0, 140),
                  )),
              const Divider(),
              ListTile(
                  title: Text(
                    LocaleKeys.arabic_language.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: CupertinoSwitch(
                    value: isArabic,
                    onChanged: (value) {
                      setState(() async {
                        isArabic = value;
                        p.toggle();
                        await context.setLocale(
                            isArabic ? const Locale('ar') : const Locale('en'));
                      });
                    },
                    activeColor: const Color.fromARGB(255, 79, 0, 140),
                  )),
            ],
          ),
        );
      });
    });
  }
}
