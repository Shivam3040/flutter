import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Load local JSON file"),
        ),
        body: Container(
          child: Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/person.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var new_data = json.decode(snapshot.data.toString());

                  return ListView.builder(
                    // Build the ListView
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text("Name: " + new_data[index]['name']),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Number: " + new_data[index]['number']),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Email: " + new_data[index]['email'])
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: new_data == null ? 0 : new_data.length,
                  );
                }),
          ),
        ));
  }
}
