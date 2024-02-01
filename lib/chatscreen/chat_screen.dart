import 'package:chatbot/chatscreen/message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Row(children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
              CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/lixian.png')),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Xian',
                    style: TextStyle(
                        fontFamily: 'Ubuntu', fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                        fontFamily: 'Ubuntu-Regular',
                        fontSize: 12,
                        color: Colors.white),
                  ),
                ],
              )
            ]),
            actions: [
              IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.black),
                  onPressed: () {}),
            ]),
        body: Stack(children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
            image: AssetImage('assets/images/1.png'),
          ))),
          Column(children: [
            SizedBox(height: 30),
            Expanded(
                child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return messages[index];
                    })),
            _buildInputField(),
          ]),
        ]));
  }

  Widget _buildInputField() {
    return Container(
        color: Colors.teal,
        padding: EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(
              child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.emoji_emotions,
                              color: Colors.grey[350], size: 25)),
                      hintText: 'Enter your message...',
                      hintStyle: TextStyle(
                          height: 2,
                          color: const Color.fromARGB(255, 220, 214, 214))))),
          IconButton(
              color: Colors.white,
              icon: Icon(Icons.send_rounded),
              onPressed: () {
                _sendMessage(true, _messageController.text);
              }),
          IconButton(
              color: Colors.black,
              icon: Icon(Icons.send_rounded),
              onPressed: () {
                _sendMessage(false, _messageController.text);
              }),
        ]));
  }

  Widget _buildAvatar() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/lixian.png'),
        ));
  }

  void _sendMessage(bool isMyMessage, String text) {
    if (text.trim().isNotEmpty) {
      setState(() {
        messages.add(Message(isMyMessage: isMyMessage, text: text.trim()));
        _messageController.clear();
      });
    }
  }
}
