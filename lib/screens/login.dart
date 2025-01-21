import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/login.dart'; // Pastikan nama file ini tidak menyebabkan konflik

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text('Login Page'), // Contoh tampilan sederhana
      ),
    );
  }
}

 




