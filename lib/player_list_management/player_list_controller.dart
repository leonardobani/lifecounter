// player_list_controller.dart
import 'package:flutter/material.dart';
import 'package:lives_Counter_App/player_tag_management/player_tag.dart';

var you = const PlayerTag(initName: "you");

class PlayerListController extends ChangeNotifier {
  final List<PlayerTag> _players = [you];

  List<PlayerTag> get players => _players;

  void addPlayer(String name) {
    _players.add(PlayerTag(initName: name));
    notifyListeners();
  }

  void removePlayer(PlayerTag player) {
    _players.remove(player);
    notifyListeners();
  }
}