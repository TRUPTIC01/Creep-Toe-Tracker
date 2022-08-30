import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MaterialColor> _colors = [Colors.teal, Colors.indigo, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Creep-Toe App"),
        //elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
      ),
      body: cryptoWidget(),
    );
  }

  Widget cryptoWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                return _getListItemUi(currency, color);
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _getListItemUi(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: Text(
        currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(
          currency['current_price'], currency['price_change_24h'].toString()),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(double priceUSD, String percentageChange) {
    TextSpan priceTextWidget =
        TextSpan(text: "\$$priceUSD\n", style: TextStyle(color: Colors.black));
    String percentageChangeText = "24 hour : $percentageChange%";
    TextSpan percentageChangeTextWidget;
    if ((double.parse(percentageChange)) > 0) {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: TextStyle(color: Colors.green),
      );
    } else {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: TextStyle(color: Colors.red),
      );
    }

    return RichText(
      text: TextSpan(children: [priceTextWidget, percentageChangeTextWidget]),
    );
  }
}
