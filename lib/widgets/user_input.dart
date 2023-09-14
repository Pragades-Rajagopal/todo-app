import 'package:example_app/models/todo_model.dart';
import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final textController = TextEditingController();
  final Function insertFunction;
  UserInput({required this.insertFunction, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      // color: const Color.fromARGB(255, 236, 203, 152),

      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.blueAccent),
              //   borderRadius: BorderRadius.circular(20),
              // ),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'type a new todo...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              if (textController.text != '') {
                var myTodo = Todo(
                    title: textController.text,
                    creationDate: DateTime.now(),
                    isChecked: false);
                insertFunction(myTodo);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                // border: Border.all(
                //   color: Colors.deepOrange,
                //   width: 2,
                // ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: const Text(
                'add',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
