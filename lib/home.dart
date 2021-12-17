import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'results.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double highet = 170.0;
  int weight = 55;
  int age = 18;
  double res = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Body Mass Index"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    gender(context, "Male"),
                    const SizedBox(
                      width: 15,
                    ),
                    gender(context, "Female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple[400],
                  ),
                  height: 10,
                  child: Column(
                    children: [
                      Text("Height",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .apply(fontWeightDelta: 4)),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(highet.toStringAsFixed(2) + " Cm",
                          style: Theme.of(context).textTheme.headline4),
                      Slider(
                          min: 10,
                          max: 250,
                          value: highet,
                          onChanged: (double value) {
                            setState(() {
                              highet = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    age1(context, "Weight"),
                    const SizedBox(
                      width: 15,
                    ),
                    age1(context, "Age"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                child: RaisedButton(
                  color: Colors.purple[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    res = weight / (pow((highet / 100), 2));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Results(res: res, isMale: isMale, age: age);
                    }));
                  },
                  child: Text("Calculate",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .apply(fontWeightDelta: 4)),
                ),
              ),
            )
          ]),
        ));
  }

  Expanded gender(BuildContext context, String type) {
    bool s = true;
    if (type == "Female") s = false;
    return Expanded(
        child: GestureDetector(
            onTap: () {
              setState(() {
                isMale = s;
              });
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: s
                      ? isMale
                          ? Colors.lightBlue
                          : Colors.purple[400]
                      : !isMale
                          ? Colors.pinkAccent
                          : Colors.purple[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      s ? Icons.male : Icons.female,
                      color: Colors.white,
                      size: 90,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(type,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .apply(fontWeightDelta: 4))
                  ],
                ))));
  }

  Expanded age1(BuildContext context, String type) {
    bool s = true;
    if (type == "Age") s = false;
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple[400]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(type,
                    style: Theme.of(context).textTheme.headline4!.apply(
                          fontWeightDelta: 4,
                        )),
                const SizedBox(
                  height: 15,
                ),
                Text(s ? '$weight' : '$age',
                    style: Theme.of(context).textTheme.headline4!),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        setState(() {
                          s ? weight++ : age++;
                        });
                      },
                      child: Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {
                        setState(() {
                          s ? weight-- : age--;
                        });
                      },
                      child: Icon(Icons.remove),
                    )
                  ],
                )
              ],
            )));
  }
}
