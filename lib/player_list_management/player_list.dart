// player_list.dart
import 'package:flutter/material.dart';
import "player_list_controller.dart";
import 'package:provider/provider.dart';

class PlayerList extends StatelessWidget {
  const PlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    final playerListController = Provider.of<PlayerListController>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newPlayerName = "";
              return AlertDialog(
                title: const Text('Add a new Player'),
                content: TextField(
                  autofocus: true,
                  onChanged: (value) {
                    newPlayerName = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      playerListController.addPlayer(newPlayerName);
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.person_add),
      ),
      appBar: AppBar(
        leading: const Icon(Icons.monitor_heart_outlined),
        title: const Text('Life Counter'),
      ),
      body: ListView.builder(
        itemCount: playerListController.players.length,
        itemBuilder: (context, index) {
          final player = playerListController.players[index];
          return Dismissible(
            key: ValueKey(player),
            background: Container(
              color: Colors.red,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Text("Player Eliminated", style: TextStyle(fontSize: 25, color: Colors.white),),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            onDismissed: (direction) {
              playerListController.removePlayer(player);
            },
            child: player,
          );
        },
      ),
    );
  }
}