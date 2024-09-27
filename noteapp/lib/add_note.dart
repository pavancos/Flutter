import 'package:flutter/material.dart';

class AddNoteDialog extends StatefulWidget {
  final Function(String, String) onAdd;

  AddNoteDialog({required this.onAdd});

  @override
  State<AddNoteDialog> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Note'),
      content: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _contentController,
            decoration: InputDecoration(labelText: 'Content'),
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: (){
          widget.onAdd(_titleController.text, _contentController.text);
        }, child: Text('Add'))
      ],
    );
  }
}
