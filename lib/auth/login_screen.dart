import 'package:chat_app/auth/register_screen.dart';
import 'package:chat_app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  login() {
    String email = emailCtrl.text;
    String password = passwordCtrl.text;

    print("email : $email ,password : $password");

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User Account Created")));
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
    }).catchError((e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to Create Account ")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("LoginScreen")),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailCtrl,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                controller: passwordCtrl,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(onPressed: () {}, child: Text("Login")),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Text("Create New Account")),
            ],
          ),
        ),
      ),
    );
  }
}
