import 'package:delivery_app/DeliverBoy/Dmainscreen.dart';
import 'package:delivery_app/DeliverBoy/signupD.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

//delivery authentication using firebase.


class DLogin extends StatefulWidget {
  @override
  _Dlogin createState() => new _Dlogin();
}

class _Dlogin extends State<DLogin> {

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
                    if(input.isEmpty){
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
                    if(input.length < 6){
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
              ],
            )
        ),
      ),
    );
  }
  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DSignUp()));
  }
  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Dmainscreen()));
      }catch(e){
        print(e.message);
      }
    }
  }
}