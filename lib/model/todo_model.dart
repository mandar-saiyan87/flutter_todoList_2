class ToDo {
  String newTaskName;
  bool isComplete;

  ToDo({required this.newTaskName, this.isComplete = false});

  static List<ToDo> todoList() {
    return [
      // ToDo(newTaskName: "Complete Todo Tutorial", isComplete: false),
      // ToDo(newTaskName: "Coffee", isComplete: false),
      // ToDo(newTaskName: "Workout", isComplete: false),
    ];
  }
}
