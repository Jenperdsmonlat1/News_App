import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/http_request_/CryptoPrice.dart';


Future<CryptoPrice> createCryptos(String symbol) async {

  final response = await http.get(
    Uri.parse("https://min-api.cryptocompare.com/data/price?fsym=$symbol&tsyms=EUR"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return CryptoPrice.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error");
  }
}