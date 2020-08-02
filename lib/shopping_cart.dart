import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  final int sum;
  final List<int> cart;
  const ShoppingCart({Key key, this.sum, this.cart}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
              child: ListView(
                children: <Widget>[
                  Text("Number of Items ${widget.cart.length}")
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              width: 1.7976931348623157e+308,
              height: 200.0,
            )
          ]),
    );
  }
}
