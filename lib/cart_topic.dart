import 'dart:collection';

import 'package:flutter/cupertino.dart';

class CartTopic extends ChangeNotifier {
  List<int> _items = [];
  UnmodifiableListView<int> get items => UnmodifiableListView(_items);
  void add(int item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  int size() => _items.length;
}