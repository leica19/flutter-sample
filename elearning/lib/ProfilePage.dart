import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw8mLW_6zKCTyvjnzqzpIMKyP-bDveCOQYNRBg88cQwUjnSFPt&s'),
        ),
        Text(
          'Shigaki Daichi',
          style: TextStyle(
            fontFamily: 'SourceSansPro',
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 20.0,
          width: 20.0,
          child: Divider(
            color: Colors.teal[100],
          ),
        ),
        Text("Keep visiting protocoderspoint.com for more contents"),
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          color: Colors.white,
          child: ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.teal[900],
            ),
            title: Text('111011111',
                style: TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0)),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          color: Colors.white,
          child: ListTile(
            leading: Icon(
              Icons.cake,
              color: Colors.teal[900],
            ),
            title: Text('1990-10-01',
                style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha')),
          ),
        )
      ],
    ));
  }
}
