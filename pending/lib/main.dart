import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:firebase_database/ui/firebase_animated_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String task;
  String detail;
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 400,
            height: 600,
            child: Image.asset(
              "assets/image.png",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            child: Text(
              "Todos",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            top: 40,
            left: 20,
          ),
          DraggableScrollableSheet(
            minChildSize: 0.1,
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollcontroller) {
              return Stack(overflow: Overflow.visible, children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('data')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return ListView(
                        controller: scrollcontroller,
                        children: snapshot.data.docs.map((document) {
                          return Container(
                            child: Column(children: [
                              ListTile(
                                title: Text(
                                  document['task'],
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  document['detail'],
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                trailing: Icon(
                                  Icons.check_circle,
                                  color: Colors.greenAccent,
                                ),
                                isThreeLine: true,
                              ),
                              Divider(
                                color: Colors.grey[700],
                              )
                            ]),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: -25,
                  right: 30,
                  child: FloatingActionButton(
                    onPressed: () => _onAlertWithCustomContentPressed(context),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.pinkAccent[400],
                  ),
                )
              ]);
            },
          )
        ],
      ),
    );
  }

  _onAlertWithCustomContentPressed(context) {
    Alert(
        context: context,
        title: "Add Task",
        content: Column(
          children: <Widget>[
            Container(
              width: 400,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.add_box_sharp),
                      labelText: 'Task',
                    ),
                    onChanged: (value) => task = value,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.add_box_sharp),
                      labelText: 'Details',
                    ),
                    onChanged: (value) => detail = value,
                  ),
                ],
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('data')
                  .add({'task': task, 'detail': detail});
              Navigator.pop(context);
            },
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
