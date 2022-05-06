import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  static const routeName = '/RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController1 = TextEditingController();

  final TextEditingController _passwordController2 = TextEditingController();
  bool _success = false;
  String _userEmail = '';
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController2.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController1.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register New User"),
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
              child: TextFormField(
                controller: _passwordController1,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your secure password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _passwordController2,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Enter your secure password again'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'I need to Login Instead',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _register();
                  }
                },
                child: const Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
