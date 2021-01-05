import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  List _outputs;
  bool _loading = false;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
      } else {
        print('No image selected.');
      }
    });
    classifyImage(File(pickedFile.path));
  }

  classifyImage(File pickedFile) async {
    var output = await Tflite.runModelOnImage(
      path: pickedFile.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print("___________________------------------------------");
    setState(() {
      _loading = false;
      _outputs = output;
    });
    print(output);
  }

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        print("helloooooooooooooooooooooooooooooooooooo");
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _image == null
              ? Text('No image selected.')
              : Image.file(
                  _image,
                  height: 500,
                  width: 100,
                ),
          _outputs != null
              ? Text(
                  "${_outputs[0]["label"]}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    background: Paint()..color = Colors.white,
                  ),
                )
              : Container()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/converted_model.tflite",
      labels: "assets/label.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
