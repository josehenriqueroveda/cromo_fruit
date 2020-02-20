import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class AnimalsGame extends StatefulWidget {
  @override
  _AnimalsGameState createState() => _AnimalsGameState();
}

class _AnimalsGameState extends State<AnimalsGame> {
  // Track the score
  final Map<String, bool> score = {};

  // Choices
  final Map choices = {
    '🐶': 'Cachorro',
    '🐴': 'Cavalo',
    '🐮': 'Vaca',
    '🐷': 'Porco',
    '🐔': 'Galinha',
    '🐱': 'Gato',
  };

  // Shuffle the order of items
  int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Animais e seus nomes',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.amber),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
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
                          fontSize: 18.0, fontWeight: FontWeight.bold))),
              height: 80,
              width: 200,
              color: Colors.grey[200],
            ),
          );
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) async {
        setState(() {
          score[emoji] = true;
          plyr.play('success.mp3');
          if(score.length == 6) {
            _complete();
          }
        });
      },
      onLeave: (data) {},
    );
  }

  Future<void> _complete() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Parabéns!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                  child: Text(
                    'Você acertou todos!',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/cute.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: FlatButton(
                child: Text(
                  'Fechar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: FlatButton(
                child: Text(
                  'Jogar novamente',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  setState(() {
                    score.clear();
                    seed++;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
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
