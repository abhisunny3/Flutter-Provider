import 'package:flutter/material.dart';
import 'package:flutter_provider/src/homepage.dart';
import 'package:provider/provider.dart';

import 'src/provider/navigation_provider.dart';

class ExampleThree extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<NavigationProvider>(
        create: (_) => NavigationProvider(),
        child: HomePage(),
      ),
    );
  }
}
