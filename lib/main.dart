import 'package:cromo_fruit/home/home_page.dart';
import 'package:cromo_fruit/splashscreen.dart';
import 'package:flutter/material.dart';


void main() => runApp(SplashScreenPage());

class CromoFruit extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Schoolbell',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
