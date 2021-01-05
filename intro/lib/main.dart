import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Container(
          color: Colors.greenAccent,
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/s.jpeg"),
                radius: 100,
              ),
              Text(
                "Introduction Application",
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 1.0),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.blue[500],
                      ),
                      title: Text("username",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.blue[500],
                      ),
                      title: Text("username",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
