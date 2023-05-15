
// import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
// part 'db_models.g.dart';
part 'db_models.g.dart';


// part 'db_models.g.dart';
// part 'db_models.g.dart';
// part 'db_models.g.dart';




@HiveType(typeId:1)
class ToDoModel{
  @HiveField(0)
  int? id ;
  @HiveField(1)
  final String task;
  @HiveField(2)
  final String  description;
  bool isValue=false;
  bool isVisible=false;

  ToDoModel({required this.task,required this.description,  this.id});

}

@HiveType(typeId:2)
class NotePadModel{
  @HiveField(0)
  int ?id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String  note;
  

  NotePadModel({required this.title,required this.note, this.id});
}