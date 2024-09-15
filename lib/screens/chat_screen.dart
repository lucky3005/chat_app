import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // List to store chat messages
  List<Map<String, dynamic>> messages = [];

  // Controller for the input field
  TextEditingController _controller = TextEditingController();

  // Function to send a message
  void _sendMessage() {
    final String messageText = _controller.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        messages.add({
          'text': messageText,
          'sentByUser': true, // You can toggle between user/bot
          'time': DateTime.now().toLocal().toString().split(' ')[1].substring(0, 5), // Time format (HH:MM)
        });
        _controller.clear(); // Clear the input field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Column(
        children: [
          // Expanded list of messages
          Expanded(
            child: ListView.builder(
              reverse: true, // ListView starts from bottom (like chat apps)
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index]; // Reverse index for proper order
                return _buildMessageBubble(message);
              },
            ),
          ),
          // Input field for typing messages
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to display each message bubble
  Widget _buildMessageBubble(Map<String, dynamic> message) {
    bool isUserMessage = message['sentByUser'];
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.blue[200] : Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment:
              isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message['text'],
              style: TextStyle(color: isUserMessage ? Colors.white : Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              message['time'],
              style: TextStyle(color: Colors.grey[600], fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
