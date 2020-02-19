import 'package:chatapp/components/Bubbles/message.bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;


class MessagesStream extends StatelessWidget {
  final FirebaseUser loggedInUser;
  MessagesStream({@required this.loggedInUser});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        // Don't reverse at first
        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageBubbles = messages.map((message){
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];
          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
          return messageBubble;
        }).toList();

        return Expanded(
          child: ListView(
            // Don't reverse at first
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
