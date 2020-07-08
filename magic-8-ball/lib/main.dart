import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'Ask Me Anything',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNum = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
            onPressed: () {
              setState(() {
                ballNum = Random().nextInt(5) + 1;
                print('I got clicked $ballNum');
              });
            },
            child: Image.asset('images/ball$ballNum.png')),
      ),
    );
  }
}
