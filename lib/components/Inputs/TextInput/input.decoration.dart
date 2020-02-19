import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'input here',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0))
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.black12,width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0))
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color:Colors.black87,width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0))
  )
);