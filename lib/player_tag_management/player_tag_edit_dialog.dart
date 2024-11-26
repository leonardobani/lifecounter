// player_tag_edit_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlayerTagEditDialog extends StatefulWidget {
  final String initialName;
  final int? initialLives;
  final Function(String, int?) onConfirm;

  const PlayerTagEditDialog({
    super.key,
    required this.initialName,
    required this.initialLives,
    required this.onConfirm,
  });

  @override
  State<PlayerTagEditDialog> createState() => _PlayerTagEditDialogState();
}

class _PlayerTagEditDialogState extends State<PlayerTagEditDialog> {
  late String editName = widget.initialName;
  late int? editLives = widget.initialLives;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Edit Player Info',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text("Edit ${widget.initialName}'s name")),
            onChanged: (value) {
              setState(() {
                editName = value;
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text("Lives: ${widget.initialLives}")),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {
              setState(() {
                editLives = int.parse(value);
              });
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context, 'Confirm');
            widget.onConfirm(editName, editLives);
          },
        ),
      ],
    );
  }
}