import 'package:flutter/material.dart';

class NewsContent extends StatefulWidget {
  final bool isFaverite;
  final Function setFaverite;

  const NewsContent({
    Key key,
    this.isFaverite,
    this.setFaverite,
  }) : super(key: key);

  @override
  _NewsContentState createState() => _NewsContentState();
}

class _NewsContentState extends State<NewsContent> {
  bool isFaverite;

  @override
  void initState() {
    isFaverite = widget.isFaverite;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: IconButton(
        color: isFaverite ? Colors.red : null,
        icon: Icon(Icons.favorite),
        onPressed: () {
          setState(() {
            isFaverite = !isFaverite;
            widget.setFaverite(isFaverite);
          });
        },
      ),
    );
  }
}
