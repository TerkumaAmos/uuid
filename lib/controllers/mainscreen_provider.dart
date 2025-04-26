import 'package:flutter/material.dart';

class MainscreenNotifier extends ChangeNotifier {
  // private variable
  int _pageIndex = 0;

  // Getter method to retrieve the value of the page index

  int get pageIndex => _pageIndex;

  //setter method to set the value of the page iondex

  set pageIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }
}
