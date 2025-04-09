import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: size.height * 0.05),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 27, 27, 27),
          image: DecorationImage(
            image: AssetImage("images/gambar.png"),
            opacity: 0.6,
          ),
        ),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 500,
                    bottom: 30,
                  ),
                ),
                SizedBox(height: 160),
                Material(
                  color: Color.fromARGB(255, 59, 57, 56),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 40),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
