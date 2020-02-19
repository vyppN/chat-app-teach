import 'package:chatapp/screens/chat.screen.dart';
import 'package:chatapp/screens/login.screen.dart';
import 'package:chatapp/screens/register.screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
    );
  }
}
