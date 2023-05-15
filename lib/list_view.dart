import 'package:flutter/material.dart';
import 'package:todo_app/db/functions/db_functions.dart';
import 'package:todo_app/update_screen.dart';

import 'db/models/db_models.dart';

class TodoList extends StatefulWidget {
  TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var _value = false;
  bool _isVisible = false;
  // final items = ['study python', 'mini project', 'ml', 'next'];

  @override
  Widget build(BuildContext context) {
    getTodo();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      body: Theme(
          data: ThemeData(
            unselectedWidgetColor: Colors.lightBlueAccent,
          ),
          child: SafeArea(
            child: ValueListenableBuilder(
              valueListenable: ToDoListNotifier,
              builder:
                  (BuildContext context, List<ToDoModel> todolist, Widget? child) {
                return ListView.builder(
                  itemCount: todolist.length,
                  itemBuilder: (context, index) {
                    final data=todolist[index];
                    data.id=index;
                    return Card(
                        color: const Color.fromARGB(255, 12, 3, 3),

                        //                           <-- Card
                        child: CheckboxListTile(
                          activeColor: Colors.greenAccent,
                          checkColor: Colors.white,
                          value: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                              _isVisible = !_isVisible;
                            });
                          },
                          title: Text(
                            data.task,
                            style: const TextStyle(color: Color(0xfff1f1f1)),
                          ),
                          subtitle: Text(
                            data.description,
                            style: const TextStyle(color: Color(0xffF1D9D9)),
                          ),
                          secondary: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible: _isVisible,
                                  child: Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            if(data.id!=null){
                                              deleteTodo(data.id!);
                                            }
                                            else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              'todo id is null')));
                                                }
                                          },
                                          icon: const Icon(
                                            Icons.delete_outline,
                                            color: Colors.redAccent,
                                          ))
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateScreen(
                                        index: index,
                                        title: data.task,
                                        description: data.description
                                        
                                        ,

                                      )));
                                       
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blueGrey,
                                    )),
                              ],
                            ),
                          ),
                          // selected: _value,
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ));
                  },
                );
              },
            ),
          )),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn_todo_3',
        onPressed: () {
          Navigator.pushNamed(context, 'add_todo');
          print('add todo');
        },
        tooltip: 'Add TAsk',
        elevation: 4.0,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white10,
        // shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FloatingActionButton(
                  heroTag: 'btn_todo_0',
                  onPressed: () {
                    // Tooltip(child: Text('ToDo'),);
                  },
                  backgroundColor: Colors.white.withOpacity(0.68),
                  foregroundColor: Colors.black87,
                  child: const Icon(Icons.add_task_outlined)),
            ),
            // Expanded(child: new Text('')),
            Expanded(
              child: FloatingActionButton(
                  heroTag: 'btn_todo_1',
                  tooltip: 'Notes',
                  onPressed: () {
                    Navigator.pushNamed(context, 'notes');
                  },
                  backgroundColor: Colors.white.withOpacity(0.68),
                  foregroundColor: Colors.black87,
                  child: const Icon(Icons.note_alt_outlined)),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
