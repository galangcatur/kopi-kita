import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/favo_screen.dart';
import 'package:flutter_application_1/screens/bag_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class HomeBottem extends StatelessWidget {
  const HomeBottem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 65,
      decoration: BoxDecoration(color: Colors.grey[800], boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          spreadRadius: 1,
          blurRadius: 8,
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: Color(0xFFe57734), size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_outline,
                color: Color(0xFFe57734), size: 30),
            onPressed: () {
              // Navigasi ke halaman FavoScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_bag, color: Color(0xFFe57734), size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BagScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Color(0xFFe57734), size: 30),
            onPressed: () {
              // Aksi ketika tombol Profile ditekan
            },
          ),
        ],
      ),
    );
  }
}
