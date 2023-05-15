import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/add_note.dart';
import 'package:todo_app/add_task.dart';
// import 'package:todo_app/home.dart';
import 'package:todo_app/list_view.dart';

import 'db/models/db_models.dart';
import 'note_add.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if(!Hive.isAdapterRegistered(ToDoModelAdapter().typeId)){
    Hive.registerAdapter(ToDoModelAdapter());
  }
  if(!Hive.isAdapterRegistered(NotePadModelAdapter().typeId)){
    Hive.registerAdapter(NotePadModelAdapter());
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xff1e1e1e)),
      home:TodoList(),
      routes: {
        'add_note':(context)=>AddNote(),
        'add_todo':(context)=>AddTask(),
        'notes':(context)=>NotePad(),
        'todo_list':(context)=>TodoList(),
      },
    );
    
  }
}