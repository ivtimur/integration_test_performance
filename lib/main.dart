import 'package:flutter/material.dart';
import 'package:integration_test_performance/chat_screen_iterable.dart';
import 'package:integration_test_performance/chat_screen_list.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram-like Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(
        items: List<String>.generate(10000, (i) => 'Item $i'),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itagration perfomance'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              key: Key('chat_screen_iterable'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      ChatScreenIterable(items: items),
                ),
              ),
              child: Text('Chat Iterable'),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              key: Key('chat_screen_list'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      ChatScreenList(items: items),
                ),
              ),
              child: Text('Chat List'),
            ),
          ],
        ),
      ),
    );
  }
}
