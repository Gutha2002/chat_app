import 'package:chat_app/auth/login_screen.dart';
import 'package:chat_app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  register() {
    String email = emailCtrl.text;
    String password = passwordCtrl.text;

    print("email : $email ,password : $password");

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
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
        title: Center(child: Text("RegisterScreen")),
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
              ElevatedButton(
                  onPressed: () {
                    register();
                  },
                  child: Text("Login")),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("Already had an Account")),
            ],
          ),
        ),
      ),
    );
  }
}
