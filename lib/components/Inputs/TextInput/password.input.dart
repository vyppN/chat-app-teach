import 'package:chatapp/components/Inputs/TextInput/input.decoration.dart';
import 'package:chatapp/components/Inputs/TextInput/text.input.dart';
import 'package:flutter/material.dart';

class LoginPassword extends StatelessWidget {
  final Function onChanged;

  LoginPassword({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return LoginText(
        secret: true,
        onChanged: (value){
          this.onChanged(value);
        },
      decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
    );
  }
}
