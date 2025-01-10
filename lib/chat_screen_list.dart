import 'package:flutter/material.dart';

class ChatScreenList extends StatefulWidget {
  const ChatScreenList({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  State<ChatScreenList> createState() => _ChatScreenListState();
}

class _ChatScreenListState extends State<ChatScreenList> {
  late final List<String> messages;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Добавляем 100 тестовых сообщений
    messages = widget.items;
  }

  void _sendMessage() {
    if (controller.text.isNotEmpty) {
      setState(() {
        messages.add('Me: ${controller.text}');
        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('chat_list'),
      appBar: AppBar(
        title: Text('Chat List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: messages.elementAt(index).startsWith('Me: ')
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      color: messages.elementAt(index).startsWith('Me: ')
                          ? Colors.blue[100]
                          : Colors.grey[300],
                      child: Text(
                        messages.elementAt(index),
                        key: Key('item_${index}_text'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Введите сообщение...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
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
}
