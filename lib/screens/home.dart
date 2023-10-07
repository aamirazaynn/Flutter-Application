import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/audio_provider.dart';
import 'package:flutter_application_1/providers/translation_provider.dart';
import 'package:flutter_application_1/widgets/text_widget.dart';
import 'package:flutter_application_1/widgets/top_likes.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application_1/translations/locale_keys.g.dart';
import 'package:just_audio/just_audio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(builder: (context, pr, child) {
      return Consumer<TranslationProvider>(builder: (context, p, child) {
        return Consumer<ThemeProvider>(builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.app.tr(),
                  style: TextStyle(
                      color: ThemeProvider.isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold)),
              centerTitle: true,
              backgroundColor: ThemeProvider.isDark
                  ? const Color.fromARGB(255, 94, 94, 94)
                  : Colors.white,
            ),
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text_Widget(text: LocaleKeys.top_likes.tr()),
              const Divider(),
              ListView.separated(
                  itemBuilder: (context, index) {
                    return Top_Likes(index: index + 1);
                  },
                  itemCount: 3,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  }),
              const Divider(),
              Text_Widget(text: LocaleKeys.top_likes.tr()),
              const Divider(),
              ListTile(
                title: InkWell(
                  child: Text(LocaleKeys.play_this.tr(),
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                ),
                leading: InkWell(
                    child: Image.asset(AudioProvider.isPlayed
                        ? "assets/images/Pause.png"
                        : "assets/images/icPlayCopy.png"),
                    onTap: () {
                      setState(() async {
                        await player.setAsset("assets/audios/sample.mp3");
                        if (AudioProvider.isPlayed) {
                          player.pause();
                        } else {
                          player.play();
                        }
                        pr.toggle();
                      });
                    }),
              ),
              const Divider(),
            ]),
          );
        });
      });
    });
  }
}
