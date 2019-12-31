import 'dart:convert' show jsonDecode;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
        // '/forth': (context) => ForthPage(),
        '/form': (context) => MainFetchData()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
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

Container myContainer(String text) {
  return Container(
    alignment: Alignment.center,
    width: 100,
    height: 100,
    color: Colors.green,
    child: Text(text),
  );
}

class MainFetchData extends StatefulWidget {
  @override
  _MainFetchDataState createState() => _MainFetchDataState();
}

class _MainFetchDataState extends State<MainFetchData> {
  List<Photo> list = List();
  var isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("https://jsonplaceholder.typicode.com/photos");
    if (response.statusCode == 200) {
      list = (jsonDecode(response.body) as List)
          .map((data) => new Photo.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fetch Data JSON"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: new Text("Fetch Data"),
            onPressed: _fetchData,
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: new Text(list[index].title),
                    trailing: new Image.network(
                      list[index].thumbnailUrl,
                      fit: BoxFit.cover,
                      height: 40.0,
                      width: 40.0,
                    ),
                  );
                }));
  }
}

class Photo {
  final String title;
  final String thumbnailUrl;
  Photo._({this.title, this.thumbnailUrl});
  factory Photo.fromJson(Map<String, dynamic> json) {
    return new Photo._(
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
