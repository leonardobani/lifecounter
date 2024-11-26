// player_tag_view.dart
import 'package:flutter/material.dart';

class PlayerTagView extends StatelessWidget {
  final String name;
  final int lives;
  final VoidCallback onDecrementLives;
  final VoidCallback onIncrementLives;

  const PlayerTagView({
    super.key,
    required this.name,
    required this.lives,
    required this.onDecrementLives,
    required this.onIncrementLives,
  });

  String heartChecker(int value) {
    switch (value) {
      case 0:
        return "💔";
      case 1:
        return "❤️";
      case 2:
        return "❤️❤️";
      case 3:
        return "❤️❤️❤️";
      default:
        return value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onDecrementLives,
                icon: const Icon(Icons.remove),
                iconSize: 50,
                color: Colors.red.shade200,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    heartChecker(lives),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: onIncrementLives,
                icon: const Icon(Icons.add),
                iconSize: 50,
                color: Colors.green.shade200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}