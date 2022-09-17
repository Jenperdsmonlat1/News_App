import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/bar/navBar.dart';
import 'package:news_app/bar/topBar.dart';
import 'package:news_app/ui/Colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebsitePage extends StatefulWidget {
  @override
  _MyWebsitePageState createState() => _MyWebsitePageState();
}

class _MyWebsitePageState extends State<MyWebsitePage> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: TopBar(),
      bottomNavigationBar: navBar(),
      body: WebView(
        initialUrl: "https://github.com/Cat-Man123/",
      ),
    );
  }
}
