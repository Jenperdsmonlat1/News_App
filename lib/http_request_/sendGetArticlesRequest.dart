import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/http_request_/Articles.dart';

Future<List<Articles>>? createArticles() async {
  final List<Articles> list;
  final response = await http.get(
    Uri.parse("https://newsapi.org/v2/top-headlines?country=fr&apiKey="),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var rest = data['articles'] as List;
    list = rest.map<Articles>((e) => Articles.fromJson(e)).toList();

    return list;
  } else {
    throw Exception("Error");
  }
}