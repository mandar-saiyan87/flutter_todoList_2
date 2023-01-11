// ignore_for_file: unused_field, avoid_print

import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  // Refference box
  final _todoBox = Hive.box('todoBox');

  List todoList = [];

  // 1st time ever opening app
  void createInitialData() {
    todoList = [
      ["Add Task", false],
      ['Mark as complete', true],
      ['Swipe left to delete', false]
    ];
  }

  // Load data from database
  void loadData() {
    todoList = _todoBox.get("TODOLIST");
  }

  // Update Database
  void updateDatabase() {
    _todoBox.put("TODOLIST", todoList);
  }
}
