import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:name_change_app/Pages/HomePage.dart';
import 'package:name_change_app/Pages/LoginPage.dart';
import 'package:name_change_app/Pages/NewApplicationFormPage.dart';
import 'package:name_change_app/Pages/PreviewPage.dart';
import 'package:name_change_app/Pages/RegisterPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'ChangeUrName',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: const LoginPage(),
      routes: {
        '/': (context) => StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomePage();
              } else {
                return LoginPage();
              }
            }),
        LoginPage.routeName: (context) => LoginPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
        HomePage.routeName: (context) => HomePage(),
        NewApplicationPage.routeName: (context) => const NewApplicationPage(),
        PreviewPage.routeName: (context) => PreviewPage(),
      },
    );
  }
}
