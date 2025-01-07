import 'package:chat_app/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("Home"),
        actions: [
          IconButton(onPressed: () {
            FirebaseAuth.instance.signOut();
               Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
          },
          icon: Icon(Icons.logout),)
        ],),
    );
  }
}