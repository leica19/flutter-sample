// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Home'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: MyPage',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: Lesson',
//       style: optionStyle,
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   Widget callPage(int selectedIndex) {
//     switch (selectedIndex) {
//       case 0:
//         return PageOne();
//       // case 1:
//       //   return HomePage();
//       // case 2:
//       //   return LessonPage();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('LMS'),
//         centerTitle: true,
//       ),
//       body: callPage(_selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(Icons.people), title: Text('マイページ')),
//           BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('ホーム')),
//           BottomNavigationBarItem(icon: Icon(Icons.tv), title: Text('講座'))
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// class PageOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: Scaffold(body: Center()));
//   }
// }

// // class HomePage extends StatelessWidget {}

// // class LessonPage extends StatelessWidget {

// // }

import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'HomePage.dart';
import 'NewsPage.dart';

Widget switchPageOnIndex(int index) {
  switch (index) {
    case 0:
      return ProfilePage();
    case 1:
      return HomePage();
    case 2:
      return NewsPage();
  }
}

void main() => runApp(MainApp());

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
          body: switchPageOnIndex(_selectedIndex),
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
