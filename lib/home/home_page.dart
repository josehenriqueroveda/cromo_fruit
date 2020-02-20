import 'package:cromo_fruit/about.dart';
import 'package:cromo_fruit/game/animals.dart';
import 'package:cromo_fruit/game/expressions.dart';
import 'package:cromo_fruit/game/fruit_colors.dart';
import 'package:cromo_fruit/game/hours.dart';
import 'package:cromo_fruit/game/numbers.dart';
import 'package:cromo_fruit/game/professions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.yellow,
        title: Text(
          "Arraste e Aprenda",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            tooltip: 'Sobre',
            onPressed: () {
               Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => About()),
                              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.lightGreenAccent,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                          child: Text(
                            "Cores",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        CupertinoButton(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(6.0, 0, 6.0, 0),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/palette.png"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FruitGame()),
                              );
                            }),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.red,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                          child: Text(
                            "Profissões",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        CupertinoButton(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(6.0, 0, 6.0, 0),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/work.png"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Professions()),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.blueAccent,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                          child: Text(
                            "Expressões",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        CupertinoButton(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(6.0, 0, 6.0, 0),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/emoji.png"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Expressions()),
                              );
                            }),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.yellow,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                          child: Text(
                            "Animais",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        CupertinoButton(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(6.0, 0, 6.0, 0),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/owl.png"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AnimalsGame()),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.amberAccent,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                          child: Text(
                            "Números",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        CupertinoButton(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(6.0, 0, 6.0, 0),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/number-blocks.png"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NumbersGame()),
                              );
                            }),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.pinkAccent,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                          child: Text(
                            "Horas",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        CupertinoButton(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(6.0, 0, 6.0, 0),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/clock.png"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HoursGame()),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
