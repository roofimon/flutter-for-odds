import 'package:flutter/material.dart';
import 'package:flutter_app/news_content.dart';
import 'package:flutter_app/shopping_cart.dart';

class CardNews extends StatefulWidget {
  final int index;
  final String title;
  final String content;
  final String imageUrl;
  final bool isFaverite;
  final int price;
  final Function myTapCallback;

  const CardNews(
      {Key key,
      @required this.index,
      @required this.title,
      @required this.content,
      @required this.imageUrl,
      @required this.isFaverite,
      @required this.price,
      @required this.myTapCallback})
      : super(key: key);

  @override
  _CardNewsState createState() => _CardNewsState();
}

class _CardNewsState extends State<CardNews> {
  bool isFaverite;

  @override
  void initState() {
    // TODO: implement initState
    isFaverite = widget.isFaverite;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          widget.myTapCallback(widget.index);
      },
      child: Card(
          shadowColor: Color.fromARGB(224, 224, 224, 224),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(widget.index.toString()),
                Text(widget.price.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child:
                          Image.network(widget.imageUrl, height: 84, width: 84),
                      padding: EdgeInsets.all(8),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  widget.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                color: isFaverite ? Colors.red : null,
                                icon: Icon(Icons.favorite),
                                onPressed: () {
                                  setState(() {
                                    isFaverite = !isFaverite;
                                  });
                                },
                              )
                            ],
                          ),
                          Text(widget.content)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
