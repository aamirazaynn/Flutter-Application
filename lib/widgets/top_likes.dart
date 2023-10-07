import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application_1/translations/locale_keys.g.dart';

class Top_Likes extends StatefulWidget {
  int index;
  Top_Likes({super.key, required this.index});

  @override
  State<Top_Likes> createState() => _Top_LikesState();
}

class _Top_LikesState extends State<Top_Likes> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${LocaleKeys.sample_text.tr()} ${widget.index}',
          style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: InkWell(
          child: Image.asset(
            isLiked
                ? "assets/images/Like_FIlled.png"
                : "assets/images/Like.png",
          ),
          onTap: () {
            setState(() {
              isLiked = !isLiked;
            });
          }),
    );
  }
}
