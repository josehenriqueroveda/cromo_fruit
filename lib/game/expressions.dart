import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Expressions extends StatefulWidget {
  @override
  _ExpressionsState createState() => _ExpressionsState();
}

class _ExpressionsState extends State<Expressions> {
  // Track the score
  final Map<String, bool> score = {};

  // Choices
  final Map choices = {
    '😴': 'Sonolento',
    '😱': 'Surpreso',
    '🤔': 'Pensativo',
    '🤣': 'Engraçado',
    '😭': 'Chorando',
    '😄': 'Feliz',
  };

  // Shuffle the order of items
  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Expressões e significados',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue,
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
                          fontSize: 18.0, fontWeight: FontWeight.bold))),
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
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
    );
  }
}

AudioCache plyr = AudioCache();
