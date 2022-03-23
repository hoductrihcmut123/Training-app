import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/video_info.dart';
import 'about_app.dart';
import "calendar.dart";
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
