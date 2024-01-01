import "package:flutter/material.dart";
import "package:to_do_app/utils/button.dart";

class CreateToDo extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  CreateToDo(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Add todo"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "Create task", onPress: onSave),
              const SizedBox(width: 8),
              MyButton(text: "Cancel", onPress: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}
