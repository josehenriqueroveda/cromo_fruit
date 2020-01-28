import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class NumbersGame extends StatefulWidget {
  @override
  _NumbersGameState createState() => _NumbersGameState();
}

class _NumbersGameState extends State<NumbersGame> {
  // Track the score
  final Map<String, bool> score = {};

  // Choices
  final Map choices = {
    '2+1': '3️⃣',
    '5+2': '7️⃣',
    '3-1': '2️⃣',
    '9-4': '5️⃣',
    '3x2': '6️⃣',
    '8÷2': '4️⃣',
  };

  // Shuffle the order of items
  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Primeiras operações',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepOrange),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
          });
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Pontuação ${score.length} / 6',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: choices.keys.map((emoji) {
                        return Draggable<String>(
                          data: emoji,
                          child:
                              Emoji(emoji: score[emoji] == true ? '✔️' : emoji),
                          feedback: Emoji(emoji: emoji),
                          childWhenDragging: Emoji(emoji: '❓'),
                        );
                      }).toList()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: choices.keys
                        .map((emoji) => _buildDragTarget(emoji))
                        .toList()
                          ..shuffle(Random(seed)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[emoji] == true) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              color: Colors.white,
              child: Text('Correto!', style: TextStyle(fontSize: 18.0)),
              alignment: Alignment.center,
              height: 80,
              width: 200,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              child: Center(
                  child: Text(choices[emoji],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 50.0))),
              height: 80,
              width: 200,
              color: Colors.grey[200],
            ),
          );
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
          plyr.play('success.mp3');
        });
      },
      onLeave: (data) {},
    );
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.blue, fontSize: 50),
        ),
      ),
    );
  }
}

AudioCache plyr = AudioCache();