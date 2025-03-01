import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/ui/add_edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        backgroundColor: Colors.green.shade200,
        centerTitle: true,
      ),
      body: notes.isEmpty
          ? const Center(
              child: Icon(
                Icons.note_add,
                size: 70,
                color: Colors.grey,
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: .9,
              ),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    final updatedNote = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddNotePage(
                          note: notes[index],
                        ),
                      ),
                    );
                    if (updatedNote != null) {
                      setState(() {
                        notes[index] = updatedNote;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(216, 208, 192, 208),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notes[index].title.toUpperCase(),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 9),
                        Text(
                          notes[index].description,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text('${notes[index].date}'),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.black54),
                              onPressed: () {
                                setState(() {
                                  notes.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade200,
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotePage()),
          );
          if (newNote != null) {
            setState(() {
              newNote as Note;
              notes.add(newNote);
            });
          }
        },
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
