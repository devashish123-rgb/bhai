import 'package:delivery_app/Setup/signup.dart';
import 'package:delivery_app/screens/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

//delivery authentication using firebase.


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("SignIn"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 75,),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Provide an email';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Email'
                  ),
                  onSaved: (input) => _email = input,
                ),
                SizedBox(height: 5,),
                TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Longer password please';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
                RaisedButton(
                  onPressed: signIn,
                  child: Text('Sign in'),
                ),
                RaisedButton(
                  onPressed: navigateToSignUp,
                  child: Text('Dont have a account? SignUp...'),
                ),
                RaisedButton(
                  onPressed: ForgetPass,
                  child: Text('Forget Password ?'),
                ),
              ],
            )
        ),
      ),
    );
  }

  void navigateToSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email, password: _password);
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  void ForgetPass() async {//implementation of forget password(half remaining).
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      } catch (e) {
        print(e.message);
      }
    }
  }
}