import 'package:flutter/material.dart';

//When the product is selected and finallized for delivery checkout page is just like billing page to pay money

class checkout extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckOut'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("   Grand Total = \u20B9 50.0",style: TextStyle(
            fontSize: 32.0,
          ),),
          RaisedButton(
            onPressed: (){},
            child: Text('Pay'),
          ),
        ],
      ),
    );
  }
}