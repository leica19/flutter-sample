import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hoico.',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('ホーム'),
        //   centerTitle: true,
        // ),
        body: Center(
          child: Text('home screen'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload),
              title: Text('アップロード'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('ホーム'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('プロフィール'),
            ),
          ],
          onTap: (int value) {
            if (value == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonalScreen()),
              );
            }
          }
        ),
      ),
    );
  }
}

/*
 * unused stateless class
 */
class UploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

class PersonalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('personal screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload),
              title: Text('アップロード'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('ホーム'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('プロフィール'),
            ),
          ],
        onTap: (int value) {
          if (value == 1) Navigator.pop(context);
        },
      ),
    );
  }
}