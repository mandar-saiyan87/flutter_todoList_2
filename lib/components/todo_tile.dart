// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onchanged;
  // final deleteTask;
  Function(BuildContext)? deleteTask;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onchanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CheckBox
              Checkbox(
                value: isCompleted,
                onChanged: onchanged,
                activeColor: Colors.black,
              ),
              // Task Name
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 17,
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


        // endActionPane: ActionPane(
        //   motion: StretchMotion(),
        //   children: [
        //     SlidableAction(
        //       onPressed: deleteTask,
        //       icon: Icons.delete,
        //       backgroundColor: Colors.red.shade300,
        //     ),

