import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: size.height * 0.05),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("images/gambar.png"),
            opacity: 0.6,
          ),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child:
                    SizedBox()), // Mengurangi tinggi Spacer agar tombol lebih ke atas
            Material(
              color: Color.fromARGB(255, 59, 57, 56),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.018,
                    horizontal: size.width * 0.2,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child:
                    SizedBox()), // Memberikan ruang di bawah agar tetap responsif
          ],
        ),
      ),
    );
  }
}
