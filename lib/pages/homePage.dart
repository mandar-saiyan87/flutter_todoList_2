// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_todo_2/components/dialogue_box.dart';
import 'package:flutter_todo_2/components/todo_tile.dart';
import 'package:flutter_todo_2/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Reference Hive Box
  final _todoBox = Hive.box('todoBox');

  // Text Controller
  final _controller = TextEditingController();

  // final todoList = ToDo.todoList();

  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if first time ever opening the app
    if (_todoBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // List todoList = [
  //   ['Complete Todo Tutorial', false],
  //   ['Coffee', true],
  //   ['Workout', false]
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: Center(child: Text('TO DO')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewTask();
        },
        child: Icon(Icons.add),
      ),
      body: db.todoList.isEmpty
          ? Center(
              child: Text('No tasks in the list'),
            )
          : ListView.builder(
              itemCount: db.todoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: db.todoList[index][0],
                  isCompleted: db.todoList[index][1],
                  onchanged: (value) => handleTask(value, index),
                  deleteTask: ((context) => deleteTask(index)),
                );
              },
            ),
    );
  }

  void handleTask(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox(
          controller: _controller,
          onSave: newTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void newTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }
}
