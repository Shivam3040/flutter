import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, sum = 0;
  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");
  void doAdd() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);

      sum = num1 + num2;
    });
  }

  void doclear() {
    setState(() {
      t1.clear();
      t2.clear();
    });
  }

  void doSub() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);

      sum = num1 - num2;
    });
  }

  void doMul() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);

      sum = num1 * num2;
    });
  }

  void dodiv() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);

      sum = num1 ~/ num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Output :$sum",
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Enter Number 1",
              ),
              controller: t1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Enter Number 2",
              ),
              controller: t2,
            ),
            Padding(padding: const EdgeInsets.only(top: 20.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+"),
                  color: Colors.lightGreenAccent,
                  onPressed: doAdd,
                ),
                new MaterialButton(
                  child: new Text("-"),
                  color: Colors.lightGreenAccent,
                  onPressed: doSub,
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                    child: new Text("*"),
                    color: Colors.lightGreenAccent,
                    onPressed: doMul),
                new MaterialButton(
                    child: new Text("/"),
                    color: Colors.lightGreenAccent,
                    onPressed: dodiv),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                    child: new Text("Clear"),
                    color: Colors.lightGreenAccent,
                    onPressed: doclear),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
