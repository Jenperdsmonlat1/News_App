import 'package:flutter/material.dart';
import 'package:news_app/bar/navBar.dart';
import 'package:news_app/bar/topBar.dart';
import 'package:news_app/ui/Colors.dart';


class AboutPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: TopBar(),
      bottomNavigationBar: navBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 75,),
            Text(
              "Cat-Man jeune joueur CTF et programmeur je suis le créateur de cette petite application que vous êtes en train de tester. Rejoignez le serveur discord.",
              style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15,),
            Text("H2G: discord.gg/bv6fkh2yKc", style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w400), textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}