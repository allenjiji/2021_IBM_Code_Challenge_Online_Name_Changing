import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name_change_app/Pages/RegisterPage.dart';
import 'package:name_change_app/main.dart';
import 'HomePage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  static const routeName = '/LoginPage';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to Proceed"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Email',
                    hintText: 'Enter valid mail id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your secure password'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RegisterPage.routeName);
              },
              child: const Text(
                'I need to Register as New User',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () => signIn(context),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signIn(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        barrierDismissible: false);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
