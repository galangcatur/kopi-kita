import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_bottem.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class FavoScreen extends StatefulWidget {
  @override
  State<FavoScreen> createState() => _FavoScreenState();
}

class _FavoScreenState extends State<FavoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {}); // Untuk memperbarui tampilan saat tab berubah
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite",
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
        backgroundColor:
            Color(0xFF212325), // Background Drawer berwarna cokelat
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF212325), // Header lebih gelap
              ),
              child: Center(
                child: Text(
                  "Favourite",
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
                "My Favourite",
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
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: ListView(
            children: [
              Center(
                child: [
                  ItemWidget(),
                  ItemWidget(),
                  ItemWidget(),
                  ItemWidget(),
                ][_tabController.index],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottem(),
    );
  }
}
