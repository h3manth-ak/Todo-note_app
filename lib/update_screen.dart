import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/db/models/db_models.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.index});
  final String title;
  final String description;
  final int index;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();

  @override
  void initState() {
    _title.text = widget.title;
    _desc.text = widget.description;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _title.dispose();
    _desc.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Screen')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: [
                TextField(
                  controller: _title,
                  decoration: InputDecoration(
                    labelText: 'Task',
                    hintText: widget.title,
                    labelStyle: const TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: _desc,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: widget.description,
                    labelStyle: const TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),

                ElevatedButton(
                  onPressed: () async {
                    final box = Hive.box<ToDoModel>('todo_db');
                    final value = ToDoModel(
                      task: _title.text,
                      description: _desc.text,
                      id: widget.index,
                    );
                    await box.putAt(widget.index, value);
                    Navigator.pop(context);
                  },
                  child: const Text('Update'),
                ),

                // ElevatedButton(
                //   // print(_task.text);
                //   // print(_desc.text);
                //   // onAddTodo();
                //   // final value=ToDoModel(task: _title.text, description: _desc.text, id:widget.index );
                //   // Navigator.pushNamed(context, 'todo_list');
                //   //   Hive.box('todo_db').putAt(widget.index, value);

                //   onPressed: () async {
                //     final box = Hive.box<ToDoModel>('todo_db');
                //     final value = ToDoModel(
                //       task: _title.text,
                //       description: _desc.text,
                //       id: widget.index,
                //     );
                //     await box.putAt(widget.index, value);
                //     Navigator.pop(context);
                //   },
                //   child: const Text('Update'),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
