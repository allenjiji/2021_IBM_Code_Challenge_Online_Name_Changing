import 'package:flutter/material.dart';
import 'package:name_change_app/Pages/RegisterPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Column(
        children:  [
          const Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name / Phone',
                  hintText: 'Enter valid mail id as abc@gmail.com'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your secure password'),
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.of(context).pushNamed(RegisterPage.routeName);
            },
            child: const Text(  
              'I need to Register as New User',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
