import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socet_example/provider/provider.dart';
import 'package:web_socet_example/view/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider(
        create: (BuildContext context) => ChatProvider(),
        child: const ChatPage(),
      ),
    );
  }
}
