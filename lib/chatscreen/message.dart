import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final bool isMyMessage;
  final String text;
  Message({required this.isMyMessage, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isMyMessage ? Colors.teal[500] : Colors.blueGrey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(text,
              style: TextStyle(
                  fontFamily: 'Ubuntu-Regular',
                  color: Colors.white,
                  fontSize: 20))),
    );
  }
}
