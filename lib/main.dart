import 'package:flutter/material.dart';
import 'package:project/screens/post_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  PostListScreen(
        rawPassword: 'testPass!',
        timestamp: '20230712120456',
        userCode: '290',
      ),
    );
  }
}
