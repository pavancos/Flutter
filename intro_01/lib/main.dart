import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'This is my first app',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(children: [
          Text(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 50, color: Colors.black87),
          ),
          Text(
            'Hello!',
            style: TextStyle(fontSize: 50, color: Colors.black87),
            textAlign: TextAlign.right,
          ),
          ElevatedButton(
              onPressed: () {
                print("Say Hello");
              },
              child: Text(
                "Hello",
                style: TextStyle(color: Colors.green),
              ))
        ])),
      ),
    );
  }
}
