import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/Home');
    });
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor:Colors.green,
    body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/LOGO2.png'),
            SizedBox(height: 20),
            //SizedBox(width: ,)
          ],
        ),
      ),
    ),
  );
}
}