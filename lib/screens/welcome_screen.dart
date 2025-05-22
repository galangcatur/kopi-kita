import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
            Expanded(flex: 15, child: SizedBox()),
            Material(
              color: Color.fromARGB(255, 59, 57, 56),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
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
            Expanded(flex: 3, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
