import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int sound) {
    final player = AudioCache();
    player.play('note$sound.wav');
  }

  Expanded buildKey(int soundNum, Color color) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(soundNum);
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(1, Colors.red),
                buildKey(
                  2,
                  Colors.orange,
                ),
                buildKey(
                  3,
                  Colors.yellow,
                ),
                buildKey(
                  4,
                  Colors.green,
                ),
                buildKey(
                  5,
                  Colors.green[900],
                ),
                buildKey(
                  6,
                  Colors.blue,
                ),
                buildKey(
                  7,
                  Colors.purple,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
