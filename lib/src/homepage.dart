import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/navigation_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Admin"),
                currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
                accountEmail: Text("12345@gmail.com")),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
                navigation.updateNavigation("Home");
              },
            ),
            ListTile(
              title: Text("Page One"),
              onTap: () {
                Navigator.of(context).pop();
                navigation.updateNavigation("PageOne");
              },
            ),
            ListTile(
              title: Text("Page Two"),
              onTap: () {
                Navigator.of(context).pop();
                navigation.updateNavigation("PageTwo");
              },
            ),
          ],
        ),
      ),
      body: Consumer<NavigationProvider>(
          builder: (context, navigationProvider, _) =>
              navigationProvider.getNavigation),
    );
  }
}
