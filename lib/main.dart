import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final random = Random.secure();
  var index = 0, hot = 0, add = 0, sum = 0;
  final dices = [
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dices game"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    dices[index],
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    dices[hot],
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text("Roll"),
                  onPressed: () {
                    setState(() {
                      index = random.nextInt(6);
                      hot = random.nextInt(6);

                      add = (index + 1) + (hot + 1);

                      if (add == 7) {
                        print("ses");
                      } else {
                        sum = sum + add;
                      }
                    });
                  }),
              Text(
                "The result is: ",
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
              Text(
                '$sum',
                style: TextStyle(color: Colors.red, fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
