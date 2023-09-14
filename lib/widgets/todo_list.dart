import 'package:example_app/widgets/todo_card.dart';
import 'package:flutter/material.dart';
import '../models/db_model.dart';

class Todolist extends StatelessWidget {
  final Function insertFunction;
  final Function deleteFunction;
  final db = DatabaseConnect();
  Todolist({
    required this.insertFunction,
    required this.deleteFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var dataLength = data!.length;
          return dataLength == 0
              ? Container(
                  color: Colors.black,
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        text: 'no items! ;-)',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: dataLength,
                  itemBuilder: (context, i) => Todocard(
                    id: data[i].id,
                    title: data[i].title,
                    creationDate: data[i].creationDate,
                    isChecked: data[i].isChecked,
                    insertFunction: insertFunction,
                    deleteFunction: deleteFunction,
                  ),
                );
        },
      ),
    );
  }
}
