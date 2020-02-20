import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFffd359), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Container(
            height: 300.0,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 20.0),
                    child: Image.asset(
                      'assets/images/dev.png',
                      scale: 6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text('Desenvolvido por: José Henrique Roveda',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
                    child: Text(
                        '*O uso do celular por crianças deve ser sob subervisão de um adulto.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}