import 'package:chatapp/components/Inputs/TextInput/input.decoration.dart';
import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  final Function onChanged;
  final bool secret;
  final InputDecoration decoration;
  LoginText({this.onChanged,this.secret = false,this.decoration});

  @override
  TextField build(BuildContext context) {
    return TextField(
      obscureText: secret,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      onChanged: (value){
        this.onChanged(value);
        },
      decoration: this.decoration == null? kTextFieldDecoration.copyWith(
        hintText: 'Email'
      ):this.decoration,
    );
  }
}
