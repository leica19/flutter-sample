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
        primarySwatch: Colors.blue,
      ),
      // home: FirstPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
        '/forth': (context) => ForthPage(),
        '/form': (context) => FormSamplePage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FirstPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
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
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forth');
              },
              child: Text('Forth Page'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              },
              child: Text('Form Page'),
            ),
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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Form')),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    icon: Icon(Icons.person),
                    hintText: '名前を入力して下さい',
                    labelText: '名前'
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return '必須です';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(const SnackBar(
                        content: Text('Processing Data'),
                      ));
                    }
                  },
                  child: const Text('Sumbit'),
                ),
              ],
            ),
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
