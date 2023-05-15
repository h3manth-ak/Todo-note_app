
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/db/models/db_models.dart';

ValueNotifier<List<ToDoModel>>ToDoListNotifier=ValueNotifier([]);
ValueNotifier<List<NotePadModel>>NotePadListNotifier=ValueNotifier([]);

Future<void> addTodo(ToDoModel todo) async{
  final todoDB=await Hive.openBox<ToDoModel>('todo_db');
  final _id=await todoDB.add(todo);
  todo.id=_id;
  ToDoListNotifier.value.add(todo);
  ToDoListNotifier.notifyListeners();
}
Future<void> addNotePad(NotePadModel notePad) async{
  final notePadDB=await Hive.openBox<NotePadModel>('notePad_db');
  final _id=await notePadDB.add(notePad);
  notePad.id=_id;
  NotePadListNotifier.value.add(notePad);
  NotePadListNotifier.notifyListeners();
}
Future<void> getTodo() async{
  final todoDB=await Hive.openBox<ToDoModel>('todo_db');
  ToDoListNotifier.value.clear();
  ToDoListNotifier.value.addAll(todoDB.values);

  // ToDoListNotifier.value=todoDB.values.toList();
  ToDoListNotifier.notifyListeners();
}
Future<void> getNotePad() async{
  final notePadDB=await Hive.openBox<NotePadModel>('notePad_db');
  NotePadListNotifier.value.clear();
  NotePadListNotifier.value.addAll(notePadDB.values);
  NotePadListNotifier.notifyListeners();
}
Future<void> deleteTodo(int id)async{
  final todoDB=await Hive.openBox<ToDoModel>('todo_db');
  await todoDB.delete(id);
  getTodo();
}
Future<void> deleteNotePad(int id)async{
  final notePadDB=await Hive.openBox<NotePadModel>('notePad_db');
  await notePadDB.delete(id);
  getNotePad();
}