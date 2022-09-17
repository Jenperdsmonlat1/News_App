import 'package:flutter/material.dart';
import 'package:news_app/AboutPage.dart';
import 'package:news_app/CryptoPricePage.dart';
import 'package:news_app/HomePage.dart';
import 'package:news_app/WebsitePage.dart';
import 'package:news_app/ui/Colors.dart';

class navBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: backgroundColorAppBarBottom,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
            icon: Icon(Icons.home),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCryptoPricePage()),
              );
            },
            icon: Icon(Icons.bar_chart),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyWebsitePage()),
              );
            },
            icon: Icon(Icons.web),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
            icon: Icon(Icons.question_mark),
          ),
        ],
      ),
    );
  }
}
