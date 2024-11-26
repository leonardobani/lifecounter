// player_tag.dart
import 'package:flutter/material.dart';
import 'package:lives_Counter_App/player_tag_management/player_tag_view.dart';
import 'player_tag_edit_dialog.dart';


class PlayerTag extends StatefulWidget {
  final String initName;
  final int? initLives;
  const PlayerTag({super.key, required this.initName, this.initLives});

  @override
  State<PlayerTag> createState() => _PlayerTagState();
}

class _PlayerTagState extends State<PlayerTag> {
  late String name = widget.initName;
  late int lives = widget.initLives ?? 1;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => showDialog(
          context: context,
          builder: (BuildContext context) => PlayerTagEditDialog(
            initialName: name,
            initialLives: lives,
            onConfirm: (newName, newLives) {
              setState(() {
                name = newName;
                lives = newLives ?? lives;
              });
            },
          )),
      child: PlayerTagView(
        name: name,
        lives: lives,
        onDecrementLives: () {
          setState(() {
            lives--;
          });
        },
        onIncrementLives: () {
          setState(() {
            lives++;
          });
        },
      ),
    );
  }
}