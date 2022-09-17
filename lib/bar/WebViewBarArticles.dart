import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/Colors.dart';

class WebViewTopBar extends StatelessWidget implements PreferredSizeWidget {

  Size get preferredSize => new Size.fromHeight(50);

  final String articleURL;
  WebViewTopBar({
    required this.articleURL
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColorAppBarBottom,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: Colors.white70,),
        ),
      title: Text(
        "${this.articleURL}",
        style: TextStyle(
          color: Colors.white70,
          fontFamily: "Noto Sans",
          fontWeight: FontWeight.w300,
          fontSize: 12,
        ),
      ),
    );
  }
}