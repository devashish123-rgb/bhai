import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'Setup/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliveryApp",
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.greenAccent
      ),
      home: WelcomePage()
    );
  }
}
