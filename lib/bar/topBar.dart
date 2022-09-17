import 'package:flutter/material.dart';
import 'package:news_app/ui/Colors.dart';


class TopBar extends StatelessWidget implements PreferredSizeWidget {

  Size get preferredSize => new Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      title: Text("News App"),
    );
  }
}