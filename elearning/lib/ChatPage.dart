import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => new _ChatPageState();
}

class ChatEntry {
  String key;
  DateTime datetime;
  String message;

  ChatEntry(this.datetime, this.message);
}

class _ChatPageState extends State<ChatPage> {
  List<ChatEntry> entries = new List();

  // Widget _buildRow(int index) {
  //   return Card(
  //     child: ListTile(
  //       title: Text(entries[index].message),
  //     ),
  //   );
  // }

  void createRecord() {
    databaseReference.child('1').set({
      'title': 'dada',
      'desc': 'dadadada'
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          RaisedButton(
            child: Text('create record'),
            onPressed: () {
              createRecord();
            },
          )
          // Expanded(
          //   child: ListView.builder(
          //     itemBuilder: (BuildContext context, int index) {
          //       return _buildRow(index);
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
