import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String password;

  const SecondScreen({Key? key, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Text('Password: $password'),
      ),
    );
  }
}
