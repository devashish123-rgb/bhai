import 'package:delivery_app/DeliverBoy/Dmainscreen.dart';
import 'package:delivery_app/DeliverBoy/signinD.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

//if delivery person dont have account he will signup using email and password.

//accepts driving phone number, licence number, and adhar number of delivery person.



class DSignUp extends StatefulWidget {
  @override
  _DSignUp createState() => _DSignUp();
}

class _DSignUp extends State<DSignUp> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _Phone, _License ,_adhar;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('SignUp'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 25,),
                TextFormField(
                  validator: (input) {
                    if(input.length < 6){
                      return 'Longer number please';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Adhar No.'
                  ),
                  onSaved: (input) => _adhar = input,
                ),
                TextFormField(
                  validator: (input) {
                    if(input.length < 6){
                      return 'Longer number please';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'License number'
                  ),
                  onSaved: (input) => _License = input,

                ),
                TextFormField(
                  validator: (input) {
                    if(input.isEmpty){
                      return 'Provide a phone number';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Phone Number'
                  ),
                  onSaved: (input) => _Phone = input,
                ),
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

                SizedBox(height: 10,),
                RaisedButton(
                  onPressed: signUp,
                  child: Text('Sign up'),
                ),
                RaisedButton(
                  onPressed: navigateToSignIn,
                  child: Text('Have a account? SignIn...'),
                ),
              ],
            )
        ),
      ),
    );
  }
  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DLogin()));
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Dmainscreen()));
      }catch(e){
        print(e.message);
      }
    }
  }
}