import 'package:chatapp/components/Buttons/RoundedButton/round.button.dart';
import 'package:chatapp/components/Inputs/TextInput/password.input.dart';
import 'package:chatapp/components/Inputs/TextInput/text.input.dart';
import 'package:chatapp/screens/chat.screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Padding(
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
              RoundedButton(
                color: Colors.orangeAccent,
                title: 'Register',
                onPressed: (){
                  print('Email: ${this.email} Password:${this.password}');
                  Navigator.pushNamed(context,ChatScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
