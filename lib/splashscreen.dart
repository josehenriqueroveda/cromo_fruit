import 'package:cromo_fruit/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenWidget(),
      theme: ThemeData(
        fontFamily: 'Schoolbell',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          backgroundColor: Colors.yellow,
          navigateAfterSeconds: HomePage(),
          loaderColor: Colors.transparent,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('ARRASTE E APRENDA',
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, fontFamily: 'Schoolbell'),
                ),
            ),
            Center(
              child: Container(
                width: 300.0,
                height: 300.0,
                child: FlareActor("assets/Tomato.flr",
                  animation: "move",
                  fit: BoxFit.contain,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Carregando...',
                style: TextStyle(fontSize: 14.0, fontFamily: 'Schoolbell'),
                ),
            ),
          ],
        ),
      ],
    );
  }
}