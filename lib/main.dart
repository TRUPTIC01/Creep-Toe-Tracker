import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:crypto/home.dart';

void main() async {
  List currencies = await getCurrency();
  print(currencies);
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //primaryColor: defaultTargetPlatform == TargetPlatform.iOS
        //? Colors.grey[100]: null
      ),
      home: new HomePage(_currencies),
      debugShowCheckedModeBanner: false,
    );
  }
}

Future<List> getCurrency() async {
  String cryptoUrl =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd";
  http.Response response = await http.get(Uri.parse(cryptoUrl));
  return json.decode(response.body);
}
