import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_bottem.dart';
import 'package:flutter_application_1/widgets/second_item.dart';

class BagScreen extends StatefulWidget {
  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bag",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF212325), // Warna AppBar
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Buka Drawer
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF212325), // Background Drawer
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF212325), // Header warna lebih gelap
              ),
              child: Center(
                child: Text(
                  "Bag",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.white),
              title: Text(
                "My Bag",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.02), // Padding agar lebih rapi
          child: ListView.builder(
            itemCount: 4, // Menampilkan 4 item
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: size.height * 0.01), // Jarak antar item
                child: SecondItem(),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: HomeBottem(),
    );
  }
}
