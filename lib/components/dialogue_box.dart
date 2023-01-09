// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import "package:flutter/material.dart";
import 'package:flutter_todo_2/components/buttonComponent.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogueBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow.shade300,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add new task"),
            ),
            // Buttons: Save & Cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonComponent(buttonText: "Save", onPress: onSave),
                ButtonComponent(buttonText: "Cancel", onPress: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
