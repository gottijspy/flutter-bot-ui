import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbotui/chat.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class LoginFaceIdButton extends StatefulWidget {
  @override
  _LoginFaceIdState createState() => _LoginFaceIdState();
}

class _LoginFaceIdState extends State<LoginFaceIdButton> {
  File _image;
  bool _showFaceIDVerification = false;

  // void openCamera() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = image;
  //   });
  // }

  void openCamera() async {
    var image = await getImageFileFromAssets("pranith.jpeg");
    //var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      _showFaceIDVerification = true;
    });
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new FloatingActionButton.extended(
            heroTag: "faceLogin",
            onPressed: () {
              openCamera();
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => ChatPage()));
            },
            icon: Icon(Icons.face),
            label: Text("Sign In with FaceID")),
        _showFaceIDVerification
            ? Container(
                padding: EdgeInsets.all(10),
                height: 200.0,
                child: _image == null ? Text('.') : Image.file(_image),
              )
            : Text(''),
        _showFaceIDVerification
            ? new FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatPage()));
                },
                label: Text("Verify"))
            : Text(''),
      ],
    );
  }
}
