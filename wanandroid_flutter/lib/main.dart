import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/home/tab_navigator.dart';
import 'package:wanandroid_flutter/user/login.dart';
import 'package:wanandroid_flutter/user/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabNavigator(),
    );
  }
}

