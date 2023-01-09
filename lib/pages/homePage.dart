// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_todo_2/components/dialogue_box.dart';
import 'package:flutter_todo_2/components/todo_tile.dart';

import '../model/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text Controller
  final _controller = TextEditingController();

  final todoList = ToDo.todoList();

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
      body: todoList.isEmpty
          ? Center(
              child: Text('No tasks in the list'),
            )
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: todoList[index].newTaskName,
                  isCompleted: todoList[index].isComplete,
                  onchanged: (value) => handleTask(value, index),
                  deleteTask: ((context) => deleteTask(index)),
                );
              },
            ),
    );
  }

  void handleTask(bool? value, int index) {
    setState(() {
      todoList[index].isComplete = !todoList[index].isComplete;
    });
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
      todoList.add(ToDo(newTaskName: _controller.text));
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }
}
