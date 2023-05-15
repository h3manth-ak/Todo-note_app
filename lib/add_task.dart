// import 'dart:js';

import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:todo_app/db/functions/db_functions.dart';
import 'package:todo_app/db/models/db_models.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});
  final _task = TextEditingController();
  final _desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        
      
      ),
      body: SafeArea(
        child: ListView(

          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: [
                TextField(
                  controller: _task,
                  decoration: const InputDecoration(
                    labelText: 'Task',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: _desc,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                ),
                
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    print(_task.text);
                    print(_desc.text);
                    onAddTodo();
                    Navigator.pushNamed(context, 'todo_list');

                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        

        ),
      ),
    );
  }

  Future<void>onAddTodo()async{
    final _todotitle=_task.text.trim();
    final _tododesc=_desc.text.trim();
    if(_todotitle.isEmpty){
      return;
      // final todo=ToDoModel(title: _todotitle, description: _tododesc);
      // await addTodo();
      // Navigator.pop(context);
    }
    else{
      final _tododb=ToDoModel(task: _todotitle, description: _tododesc);
      addTodo(_tododb);
      // 
    }
  }
}
