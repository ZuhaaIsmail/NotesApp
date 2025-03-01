import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/ui/widgets.dart';

class AddNotePage extends StatefulWidget {
  final Note? note;
  AddNotePage({this.note, super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {

  final titleController = TextEditingController();
  final subTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    if(widget.note != null) {
      titleController.text = widget.note!.title;
      subTitleController.text = widget.note!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Add Note' : 'Edit Note'),
        backgroundColor: Colors.green.shade200,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            myTextField('Title', titleController, 1),
            const SizedBox(height: 14),
            myTextField('Enter your note', subTitleController, 12),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty && subTitleController.text.isNotEmpty){
                  Note note = Note(1, DateTime.now().year, titleController.text, subTitleController.text);
                  Navigator.pop(context, note);
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                widget.note == null ? 'Save Note' : 'Update Note',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
