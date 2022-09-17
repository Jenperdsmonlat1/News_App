import 'package:flutter/material.dart';
import 'package:news_app/ArticleReader.dart';
import 'package:news_app/bar/navBar.dart';
import 'package:news_app/bar/topBar.dart';
import 'package:news_app/http_request_/Articles.dart';
import 'package:news_app/http_request_/sendGetArticlesRequest.dart';
import 'package:news_app/ui/Colors.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  Widget listArticles(List<Articles>? articles) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, position) {
        return Container(
          margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
          decoration: BoxDecoration(
            color: backgroundColorAppBarBottom,
            borderRadius: BorderRadius.circular(15.0)
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(articles![position].urlToImage,),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  "${articles[position].title}",
                  style: TextStyle(
                    //fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Colors.white70
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyArticlesReader(articleURL: articles[position].url)),
                        );
                      },
                      icon: Icon(Icons.web, color: Colors.white70,),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.white70,
                        )
                      ),
                      label: Text(
                        "Lire l'article",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Noto Sans MS",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      backgroundColor: backgroundColor,
      bottomNavigationBar: navBar(),
      body: FutureBuilder<List<Articles>>(
              future: createArticles(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return listArticles(snapshot.data);
                } else if (snapshot.hasError) {
                  return ErrorBanner();
                }

                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent.shade700,
                  ),
                );
              },
            ),
    );
  }
}

class ErrorBanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      backgroundColor: backgroundColorAppBarBottom,
      content: Text(
        "Une erreur est survenue impossible d'afficher les articles du jour",
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.white70,
        foregroundColor: backgroundColor,
        child: Icon(Icons.wifi),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            createArticles();
          },
          child: Text(
            "Réessayer",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: Text(
            "Fermer",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}