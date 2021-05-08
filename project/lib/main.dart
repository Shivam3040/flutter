import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(child: MyHomePage()),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: HexColor("#F67280"),
      appBar: new AppBar(
        title: new Text("Movie Recommendation"),
        backgroundColor: HexColor("#6C5B7B"),
      ),
      body: Container(
        child: Center(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                title: Center(
                  child: new TextField(
                    controller: _textController,
                    decoration: InputDecoration(hintText: 'neerja,maasan,..'),
                  ),
                ),
              ),
              new ListTile(
                title: Center(
                  child: new RaisedButton(
                    child: new Text("search"),
                    onPressed: () {
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new NextPage(value: _textController.text),
                      );
                      Navigator.of(context).push(route);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GetUsers {
  String movie;

  GetUsers({
    this.movie,
  });

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(movie: json['movie']);
  }
}

class NextPage extends StatefulWidget {
  final String value;

  NextPage({Key key, this.value}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    String apiURL =
        'https://movie-remmendation-api.herokuapp.com/' + '${widget.value}';

    Future<List<GetUsers>> fetchJSONData() async {
      var jsonResponse = await http.get(apiURL);
      print(jsonResponse);
      if (jsonResponse.statusCode == 200) {
        final jsonItems =
            json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
        print(jsonItems);

        List<GetUsers> usersList = jsonItems.map<GetUsers>((json) {
          return GetUsers.fromJson(json);
        }).toList();

        return usersList;
      } else {
        throw Exception('Failed to load data from internet');
      }
    }

    return new Scaffold(
      backgroundColor: HexColor("#F67280"),
      appBar: AppBar(
        title: Text('Related Movies'),
        backgroundColor: HexColor("#6C5B7B"),
      ),
      body: FutureBuilder<List<GetUsers>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map(
                  (user) => ListTile(
                    title: Text(user.movie),
                    leading: Icon(Icons.movie_creation),
                    onTap: () {
                      print(user.movie);
                    },
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
