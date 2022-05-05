import 'package:flutter/material.dart';
import 'package:name_change_app/Pages/LoginPage.dart';
import 'package:name_change_app/Pages/RegisterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      // home: const LoginPage(),
      routes: {
        '/': (context) => const LoginPage(),
        LoginPage.routeName:(context) => const LoginPage(),
        RegisterPage.routeName: (context)=> const RegisterPage(),
      },
    );
  }
}
