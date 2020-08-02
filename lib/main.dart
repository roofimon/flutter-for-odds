import 'package:flutter/material.dart';
import 'package:flutter_app/cart_topic.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartTopic(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: LoginPage(),
    );
  }
}
