import 'package:flutter/material.dart';
import 'package:flutter_app/card_news.dart';
import 'package:flutter_app/cart_topic.dart';
import 'package:flutter_app/news_model.dart';
import 'package:flutter_app/shopping_cart.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  List<NewsModel> list;

  NewsPage({this.list});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  CartTopic cart;

  void myTapCallback(int index) {
    print('user tapped on ' + index.toString());
    cart.add(index);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cart = Provider.of<CartTopic>(context);
    print(widget.list);
  }

  @override
  Widget build(BuildContext context) {
    print('page ddddd');
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoppingCart()),
                );
              }),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              cart.removeAll();
            },
          ),
          CartButton(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: widget.list.map((model) => CardNews(
            index: model.index,
            title: model.title,
            content: model.content,
            imageUrl: 'http://54.255.151.162:8000${model.image}',
            isFaverite: true,
            price: 10,
            myTapCallback: myTapCallback,
          )).toList(),
        ),
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartTopic>(
      builder: (context, cart, child) {
        print('cart btn build');
        return RaisedButton(
          onPressed: () {},
          child: Text("${cart.size()}"),
        );
      },
    );
  }
}
