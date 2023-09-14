import 'package:example_app/models/db_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/todo_model.dart';
import 'package:flutter/material.dart';
import '../widgets/user_input.dart';
import '../widgets/todo_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // DB operations to add and delete todo
  var db = DatabaseConnect();
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 250, 173, 85),
      backgroundColor: Colors.black,
      appBar: todoAppBar(),
      body: Column(
        children: [
          Todolist(
            insertFunction: addItem,
            deleteFunction: deleteItem,
          ),
          // Todocard(),
          UserInput(
            insertFunction: addItem,
          ),
        ],
      ),
    );
  }

  AppBar todoAppBar() {
    return AppBar(
      title: const Text('todo app'),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      forceMaterialTransparency: false,
      centerTitle: true,
      elevation: 0.0,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 18,
      ),
    );
  }
}

// 31:21