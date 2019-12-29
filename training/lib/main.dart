import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        accentColor: Colors.black,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent
        ),
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      // home: FirstPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
        '/forth': (context) => ForthPage(),
        '/form': (context) => FormSamplePage(),
        '/material': (context) => MaterialPage()
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // RaisedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/second',
            //         arguments: 'messageFromFirstPage');
            //   },
            //   child: Text('Second Page'),
            // ),
            // Expanded(child: RaisedButton(
            //   onPressed: () {
            //   },
            //   child: Text('to Where?'),
            // )),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third',
                    arguments: 'messageFromFirstPage');
              },
              child: Text('Third Page'),
            ),
            // RaisedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/forth');
            //   },
            //   child: Text('Forth Page'),
            // ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              },
              child: Text('Form Page'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/material');
              },
              child: Text('Material Page'),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {
    var messageFromFirstPage = ModalRoute.of(context).settings.arguments;
    print(messageFromFirstPage);
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context, 'messageFromSecondPage');
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  Widget build(BuildContext context) {
    var messageFromFirstPage = ModalRoute.of(context).settings.arguments;
    print(messageFromFirstPage);
    return Scaffold(
      appBar: AppBar(title: const Text('Third Page')),
      // body: Container(
      //   alignment: Alignment.center,
      //   color: Colors.green,
      //   width: 300,
      //   height: 300,
      //   child: RaisedButton(
      //     onPressed: () {
      //       Navigator.pop(context, 'messageFromSecondPage');
      //     },
      //     child: Text('Go Back'),
      //   ),
      // ),

      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisSpacing: 16.0,
            crossAxisCount: 3,
            childAspectRatio: 2),
        scrollDirection: Axis.vertical,
        primary: false,
        padding: const EdgeInsets.all(32.0),
        children: <Widget>[
          myContainer('1'),
          myContainer('2'),
          myContainer('3'),
          myContainer('4'),
          myContainer('5'),
          myContainer('6')
        ],
      ),

      // body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       myContainer('dada'),
      //       myContainer('dada'),
      //       myContainer('dada'),
      //       myContainer('dada'),
      //       myContainer('dada'),
      //       myContainer('dada'),
      //       myContainer('dada'),
      //       myContainer('dada'),
      //     ],
      //   ),
      // ),
    );
  }
}

class MaterialPage extends StatelessWidget {
  Widget build(BuildContext context) {
    var messageFromFirstPage = ModalRoute.of(context).settings.arguments;
    print(messageFromFirstPage);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Page'),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              const PopupMenuItem<String>(
                value: 'Toolbar Menu',
                child: Text('Toolbar Menu'),
              ),
              const PopupMenuItem<String>(
                value: 'Hoge Menu',
                child: Text('Hoge Menu'),
              ),
            ],
          )
        ],
        ),
        body: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)
            ),
            child: Column(
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('title'),
                ),
              ],
            ),
          ),
        )
    );
  }
}
class ForthPage extends StatelessWidget {
  Widget build(BuildContext context) {
    var messageFromFirstPage = ModalRoute.of(context).settings.arguments;
    print(messageFromFirstPage);
    return Scaffold(
      appBar: AppBar(title: const Text('Forth Page')),
      body: PageView(
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class FormSamplePage extends StatelessWidget {
  int _selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(
      //   appBar: AppBar(title: const Text('Form')),
      //   body: Form(
      //     key: _formKey,
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Column(
      //         children: <Widget>[
      //           TextFormField(
      //             decoration: const InputDecoration(
      //                 filled: true,
      //                 icon: Icon(Icons.person),
      //                 hintText: '名前を入力して下さい',
      //                 labelText: '名前'),
      //             validator: (value) {
      //               if (value.isEmpty) {
      //                 return '必須です';
      //               }
      //               return null;
      //             },
      //           ),
      //           RaisedButton(
      //             color: Colors.blue,
      //             textColor: Colors.white,
      //             onPressed: () {
      //               if (_formKey.currentState.validate()) {
      //                 Scaffold.of(context).showSnackBar(const SnackBar(
      //                   content: Text('Processing Data'),
      //                 ));
      //               }
      //             },
      //             child: const Text('Sumbit'),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike))
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('Business'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('School'),
              )
            ],
            currentIndex: _selectedIndex,
          ),
        ),
      ),
    );
  }
}

Container myContainer(String text) {
  return Container(
    alignment: Alignment.center,
    width: 100,
    height: 100,
    color: Colors.green,
    child: Text(text),
  );
}
