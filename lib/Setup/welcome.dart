
import 'package:delivery_app/DeliverBoy/signinD.dart';
import 'package:delivery_app/Setup/signin.dart';
import 'package:flutter/material.dart';

//when the app is launch it will be first screen.
//here user will select he wants to login as delivery person or as a user..

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: navigateToSignInOfcustomer,
            child: Text('Sign in as customer..'),
          ),
          RaisedButton(
            onPressed: navigateToSignInOfDelivery,
            child: Text('Sign in as Delivery Person..'),
          ),
        ],
      ),
    );
  }

  //two completely different routes...

  void navigateToSignInOfcustomer(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void navigateToSignInOfDelivery(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DLogin()));
  }
}