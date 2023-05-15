import 'package:flutter/material.dart';
import 'package:todo_app/db/functions/db_functions.dart';

import 'db/models/db_models.dart';

class NotePad extends StatelessWidget {
  const NotePad({super.key});

  @override
  Widget build(BuildContext context) {
    getNotePad();
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotePad'),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: NotePadListNotifier,
          builder:
              (BuildContext context, List<NotePadModel> notelist, Widget? child) {
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              //note ui
              // childAspectRatio: ,
              children: List.generate(notelist.length, (index) {
                final data=notelist[index];
                return Card(
                    color: const Color(0xff1e1e1e),
                    elevation: 10.0,
                    // margin: EdgeInsets.all(10),

                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 15,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 15,
                              ),
                              onPressed: ( ) {
                                if(data.id!=null){
                                              deleteNotePad(data.id!);
                                            }
                                            else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              'todo id is null')));
                                                }
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(data.title
                                ,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 12,
                                  left: 8,
                                ),
                                child: SizedBox(
                                  // height: 100,
                                  // width: 100,
                                  child: Text(
                                    data.note,
                                    // maxLines: 10,
                                    // overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ));
              }),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn1',
        onPressed: () {
          Navigator.pushNamed(context, 'add_note');
        },
        tooltip: 'Add Note',
        backgroundColor: Colors.greenAccent,
        // foregroundColor: Colors.amberAccent,
        child: new Icon(Icons.add),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white10,
        // shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FloatingActionButton(
                  heroTag: 'btn2',
                  onPressed: () {
                    Navigator.pushNamed(context, 'todo_list');
                  },
                  backgroundColor: Colors.white.withOpacity(0.68),
                  foregroundColor: Colors.black87,
                  child: const Icon(Icons.add_task_outlined)),
            ),
            // Expanded(child: new Text('')),
            Expanded(
              child: FloatingActionButton(
                  heroTag: 'btn3',
                  onPressed: () {},
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
