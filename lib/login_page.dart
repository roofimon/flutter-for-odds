import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'news_model.dart';
import 'news_page.dart';

class LoginPage extends StatelessWidget {
  Future<List<NewsModel>> getHttp() async {
    try {
      Response response = await Dio().get("http://54.255.151.162:8000/news/");
      List<NewsModel> list;

      if (response.data != null) {
        list = List<NewsModel>();
        response.data.forEach((json) {
          list.add(NewsModel.fromJson(json));
        });
      }

      return list;
    } catch (e) {
      print(e);
      return List<NewsModel>();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Title'),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Username'),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text('Password'),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
              ButtonTheme(
                minWidth: 500,
                height: 50,
                child: RaisedButton(
                  onPressed: () async {
                    var list = await getHttp();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewsPage(list: list,)));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
