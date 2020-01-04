import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'HomePage.dart';
import 'NewsPage.dart';

void main() => runApp(MainApp());

Widget renderPageBasedOnIndex(int index) {
  switch (index) {
    case 0:
      return ProfilePage();
    case 1:
      return HomePage();
    case 2:
      return NewsPage();
  }
}

class MainApp extends StatefulWidget {
  _MainAppState createState() => new _MainAppState();
}

class _MainAppState extends State<MainApp> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('LMS'),
          ),
          body: renderPageBasedOnIndex(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('プロフィール'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('ホーム')
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('ニュース')
              )
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          )),
    );
  }
  
}
