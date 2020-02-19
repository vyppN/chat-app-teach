import 'dart:math';

import 'package:chatapp/components/Streams/message.stream.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';


  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();

  String messageText;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    this.getCurrentUser();
  }

  void getCurrentUser() async {
    try{
      final user = await _auth.currentUser();
      if(user != null) {
        setState(() {
          loggedInUser = user;
        });
      }
      print(user);
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chat Room'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              _auth.signOut();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(loggedInUser: loggedInUser,),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller:messageTextController,
                      onChanged: (value){
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.black87, width: 1.0),
  ),
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type here...',
  border: InputBorder.none,
);


const kSendButtonTextStyle = TextStyle(
  color: Colors.blueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);