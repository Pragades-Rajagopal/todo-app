import 'package:example_app/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Todocard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationDate;
  bool isChecked;
  final Function insertFunction;
  final Function deleteFunction;

  Todocard({
    required this.id,
    required this.title,
    required this.creationDate,
    required this.isChecked,
    required this.insertFunction,
    required this.deleteFunction,
    super.key,
  });

  @override
  State<Todocard> createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  @override
  Widget build(BuildContext context) {
    var newTodo = Todo(
      id: widget.id,
      title: widget.title,
      creationDate: widget.creationDate,
      isChecked: widget.isChecked,
    );
    return Card(
      // color: const Color.fromARGB(255, 253, 246, 234),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(
                  () {
                    widget.isChecked = value!;
                  },
                );
                newTodo.isChecked = value!;
                widget.insertFunction(newTodo);
              },
              shape: const CircleBorder(),
              fillColor: MaterialStateProperty.resolveWith((states) {
                return Colors.black;
              }),
              checkColor: Colors.white,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.isChecked == true
                    ? Text(
                        widget.title,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 18,
                        ),
                      )
                    : Text(
                        widget.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  DateFormat('dd MMM yyyy hh:mm aaa')
                      .format(widget.creationDate),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              widget.deleteFunction(newTodo);
              ScaffoldMessenger.of(context).showSnackBar(
                todoSnackBar(),
              );
            },
            icon: const Icon(
              Icons.delete_sweep_outlined,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  SnackBar todoSnackBar() {
    return const SnackBar(
      content: Text('todo deleted'),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 72.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      duration: Duration(seconds: 1),
    );
  }
}
