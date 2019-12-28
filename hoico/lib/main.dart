
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
// import 'camera.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hoico.',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('ホーム'),
        //   centerTitle: true,
        // ),
        body: VideoApp(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload),
              title: Text('投稿'),
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
                MaterialPageRoute(builder: (context) => PersonalPage()),
              );
            } else if (value == 0) {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadPage()),
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
class UploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text('upload pages'),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        // Add your onPressed code here!
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload),
              title: Text('投稿'),
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
          if (value == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
          } else if (value == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonalPage()),
              );
          }
        },
      ),
    ),
    );
  }
}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'つなげるKids保育',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '大阪府吹田市広芝町10番25号 第2池上ビル1階',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text('41'),
    ],
  ),
);

class PersonalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'images/tunagel.jpg'
              ),
              titleSection,
              ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('投稿'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: const Text('フォロー'),
                      onPressed: () { /* ... */ },
                    ),
                    FlatButton(
                      child: const Text('フォロワー'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud_upload),
              title: Text('投稿'),
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
          if (value == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadPage()),
              );
          } else if (value == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
          }
        },
      ),
    ),
    );
  }
}

class FollowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

