import 'package:chatapp/components/Buttons/RoundedButton/round.button.dart';
import 'package:chatapp/components/Inputs/TextInput/password.input.dart';
import 'package:chatapp/components/Inputs/TextInput/text.input.dart';
import 'package:chatapp/screens/chat.screen.dart';
import 'package:chatapp/screens/register.screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left:16.0,top:120.0,right:16.0,bottom:16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LoginText(
              onChanged: (value){
                email = value;
              },
            ),
            SizedBox(height: 16,),
            LoginPassword(
              onChanged: (value){
                password = value;
              },
            ),
            SizedBox(height: 16,),
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Login',
              onPressed: ()async {
                try{
                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if(user != null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                }catch(e){
                  print(e);
                }

              },
            ),
            RoundedButton(
              color: Colors.orangeAccent,
              title: 'Register',
              onPressed: (){
                print('Email: ${this.email} Password:${this.password}');
                Navigator.pushNamed(context, RegisterScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
