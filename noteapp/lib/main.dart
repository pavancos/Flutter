import 'package:flutter/material.dart';
import 'package:noteapp/add_note.dart';
import 'note.dart';
import 'objectbox.g.dart';

late Store store;
late Box<Note> noteBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  store = await openStore();
  noteBox = store.box<Note>();

  runApp(const LocalDataBaseCenter());
}

class LocalDataBaseCenter extends StatelessWidget {
  const LocalDataBaseCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Centralised DB',
      theme: ThemeData(primaryColor: Colors.teal),
      home: NoteListScreen(),
    );
  }
}

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _refreshRecords();
  }

  void _refreshRecords() {
    setState(() {
      _notes = noteBox.getAll();
    });
  }

  void _addNote() {
    showDialog(
        context: context,
        builder: (context) {
          return AddNoteDialog(
            onAdd: (title, content) {
              final note = Note(title: title, content: content);
              noteBox.put(note);
              _refreshRecords();
            },
          );
        });
  }

  void _deleteNote(int id) {
    noteBox.remove(id);
    _refreshRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            final _note = _notes[index];
            return ListTile(
              title: Text(_note.title),
              subtitle: Text(_note.content),
              trailing: IconButton(
                  onPressed: () => _deleteNote(_note.id),
                  icon: Icon(Icons.delete)),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: _addNote,
      child: Icon(Icons.add),),
    );
  }
}
