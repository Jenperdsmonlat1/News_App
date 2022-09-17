import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bar/navBar.dart';
import 'package:news_app/bar/topBar.dart';
import 'package:news_app/http_request_/CryptoPrice.dart';
import 'package:news_app/http_request_/sendGetCryptoPriceRequest.dart';
import 'package:news_app/ui/Colors.dart';

class MyCryptoPricePage extends StatefulWidget {
  @override
  _MyCryptoPricePageState createState() => _MyCryptoPricePageState();
}

class _MyCryptoPricePageState extends State<MyCryptoPricePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: navBar(),
      appBar: TopBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CryptoPriceStage(
              firstColor: Color(0xFFFF512F),
              secondColor: Color(0xFFDD2476),
              symbol: "BTC",
              cryptoname: "Bitcoin",
            ),
            CryptoPriceStage(
              firstColor: Color(0xFF16A085),
              secondColor: Color(0xFFF4D03F),
              symbol: "Eth",
              cryptoname: "Ethereum",
            ),
            CryptoPriceStage(
              firstColor: Color(0xFFDE6262),
              secondColor: Color(0xFFFFB88C),
              symbol: "XMR",
              cryptoname: "Monero",
            ),
            CryptoPriceStage(
              firstColor: Color(0xFFB993D6),
              secondColor: Color(0xFF8CA6DB),
              symbol: "XRP",
              cryptoname: "Ripple",
            ),
            CryptoPriceStage(
              firstColor: Color(0xFFffb347),
              secondColor: Color(0xFFffcc33),
              symbol: "TUSD",
              cryptoname: "Tether",
            ),
          ],
        ),
      ),
    );
  }
}

class CryptoPriceStage extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final String symbol;
  final String cryptoname;

  CryptoPriceStage(
      {required this.firstColor,
      required this.secondColor,
      required this.symbol,
      required this.cryptoname});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CryptoPrice>(
      future: createCryptos(symbol),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    this.firstColor,
                    this.secondColor,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 20,
                      spreadRadius: 10,
                      color: Colors.black12),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("img/$cryptoname.png"),
                Text(
                  "$cryptoname price",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Noto Sans MS",
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  "${snapshot.data!.price}€",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Noto Sans MS",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "${snapshot.error}",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontFamily: "Noto Sans MS",
                fontSize: 16,
              ),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            color: Colors.redAccent,
          ),
        );
      },
    );
  }
}
