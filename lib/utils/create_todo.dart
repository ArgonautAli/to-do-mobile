import "package:flutter/material.dart";
import "package:to_do_app/utils/button.dart";

class CreateToDo extends StatelessWidget {
  const CreateToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Add todo"),
          ),
          Row(
            children: [MyButton()],
          )
        ]),
      ),
    );
  }
}
