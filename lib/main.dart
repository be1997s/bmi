import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          canvasColor: Colors.grey[800],
          textTheme: TextTheme(
              headline4: TextStyle(color: Colors.white, fontSize: 27))),
      home: const MyHomePage(),
    );
  }
}
