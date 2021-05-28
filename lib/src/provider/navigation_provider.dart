import 'package:flutter/material.dart';
import 'package:flutter_provider/src/ui/home.dart';
import 'package:flutter_provider/src/ui/page_one.dart';
import 'package:flutter_provider/src/ui/page_two.dart';

class NavigationProvider with ChangeNotifier {
  String currentNavigation = "Home";

  Widget get getNavigation {
    if (currentNavigation == "PageOne") {
      return PageOne();
    } else if (currentNavigation == "PageTwo") {
      return PageTwo();
    } else {
      return Home();
    }
  }

  void updateNavigation(String navigation) {
    currentNavigation = navigation;
    notifyListeners();
  }
}
