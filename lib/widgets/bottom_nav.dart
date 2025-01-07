import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  BottomNav(this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        // Arahkan ke halaman sesuai indeks
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/Home');
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/Wish');
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, '/Saldo');
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Keranjang',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.money),
          label: 'saldo',
        ),
      ],
    );
  }
}
