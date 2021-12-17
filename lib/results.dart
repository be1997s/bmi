import 'dart:ui';

import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results(
      {Key? key, required this.res, required this.isMale, required this.age})
      : super(key: key);
  final double res;
  final bool isMale;
  final int age;
  String get resultsph {
    String s = '';
    if (res >= 30)
      s = "Obese";
    else if (res > 25 && res < 30)
      s = "Obese";
    else if (res >= 18.5 && res <= 24.9)
      s = "normal";
    else
      s = "thin";
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          SizedBox(height: 200),
          Text(
            "Gender: ${isMale ? "Male" : "Female"}",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 20),
          Text(
            "Result: ${res.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 20),
          Text(
            "Healthinees: ${resultsph}",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 20),
          Text(
            "Age: $age",
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ))),
    );
  }
}
