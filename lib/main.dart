import 'package:flutter/material.dart';
import 'package:tes/home.dart';
import 'package:tes/splash.dart';
import 'package:tes/saldo.dart';
import 'package:tes/wish.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'TokoAji',
      routes: {
        '/': (context) => SplashPage(),
        '/Home': (context) => HomePage(),
        '/Wish': (context) => CartPage(),
        '/Saldo': (context) => SaldoPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}