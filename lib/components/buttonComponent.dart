// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";

class ButtonComponent extends StatelessWidget {
  final String buttonText;
  VoidCallback onPress;
  ButtonComponent({super.key, required this.buttonText, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      color: Theme.of(context).backgroundColor,
      child: Text(buttonText),
    );
  }
}
