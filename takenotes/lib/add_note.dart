import 'package:flutter/material.dart';

class AddNoteDialog extends StatefulWidget {
  final Function(String, String) onAdd;

  const AddNoteDialog({super.key, required this.onAdd});

  @override
  State<AddNoteDialog> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Note'),
      content: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _contentController,
            decoration: const InputDecoration(labelText: 'Content'),
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: (){
          widget.onAdd(_titleController.text, _contentController.text);
        }, child: const Text('Add'))
      ],
    );
  }
}