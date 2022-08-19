// ignore_for_file: prefer_const_constructors

import 'package:customclippers/myclips.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text("Custom Clipper Using ClipPath"),
          ),
          body: GridView.builder(
              itemCount: 8,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => GridTile(
                      child: ClipPath(
                    clipper: MyClips(),
                    child: Image.asset(
                      "assets/images/dog (${index + 1}).jpg",
                      fit: BoxFit.cover,
                    ),
                  )))),
    );
  }
}
