import 'package:flutter/material.dart';
class InternetProvider extends ChangeNotifier {
  bool noInternet = true;
  void changeConnectionStatus(bool noInternet) {
    this.noInternet = noInternet;
    notifyListeners();
  }
}