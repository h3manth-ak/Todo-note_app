import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todo_app/db/functions/db_functions.dart';
import 'package:todo_app/db/models/db_models.dart';

class AddNote extends StatelessWidget {
   AddNote({super.key});
  final _title=TextEditingController();
  final _note=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      
      ),
      body: SafeArea(
        child: ListView(

          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: [
                TextField(
                  controller: _title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    
                    labelText: 'Title',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _note,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Note',
                    labelStyle: TextStyle(color: Colors.white),
                    
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    print(_title.text);
                    print(_note.text);
                    onAddNote();
                    Navigator.pushNamed(context, 'notes');
                    
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        

        )

        
      ),
    );
  }

  Future<void>onAddNote()async{
    final _notetitle=_title.text.trim();
    final _notenote=_note.text.trim();
    if(_notetitle.isNotEmpty&&_notenote.isEmpty){
      return;
    }
    else{
      final _notedb=NotePadModel(title: _notetitle, note: _notenote);
      addNotePad(_notedb);
    }
  }
}