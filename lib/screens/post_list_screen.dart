import 'package:flutter/material.dart';
import 'package:project/http_helper.dart';
import 'package:project/second_screen.dart';


class PostListScreen extends StatefulWidget {
   String userCode;
   String timestamp;
   String rawPassword;

   PostListScreen({
    Key? key,
    required this.userCode,
    required this.timestamp,
    required this.rawPassword,
  }) : super(key: key);

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late Future<String> _futurePassword;

  @override
  void initState() {
    super.initState();
    _futurePassword = HttpHelper().fetchPassword(
      widget.userCode,
      widget.timestamp,
      widget.rawPassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'User Code',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  widget.userCode = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Timestamp',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  widget.timestamp = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Raw Password',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  widget.rawPassword = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _futurePassword = HttpHelper().fetchPassword(
                    widget.userCode,
                    widget.timestamp,
                    widget.rawPassword,
                  );
                });
              },
              child: const Text('Get Password'),
            ),
            const SizedBox(height: 20),
            FutureBuilder<String>(
              future: _futurePassword,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error occurred: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final password = snapshot.data!;
                  return Column(
                    children: [
                      Text('Password: $password'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondScreen(password: password),
                            ),
                          );
                        },
                        child: const Text('Go to Second Screen'),
                      ),
                    ],
                  );
                } else {
                  return const Text('No data available');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
