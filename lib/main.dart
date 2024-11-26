// main.dart
import 'package:flutter/material.dart';
import 'package:lives_Counter_App/player_list_management/player_list.dart';
import 'player_list_management/player_list_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlayerListController(),
      child: const LivesCounterApp(),
    ),
  );
}

class LivesCounterApp extends StatelessWidget {
  const LivesCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lives Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlayerList(),
    );
  }
}