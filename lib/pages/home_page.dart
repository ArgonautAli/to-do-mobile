import "package:flutter/material.dart";
import "package:to_do_app/utils/create_todo.dart";
import "package:to_do_app/utils/todo_tile.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ["Learn flutter", false],
    ["Go to gym", true]
  ];

  void checkboxChanged(bool? status, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void openDialogue(context) {
    showDialog(
        context: context,
        builder: (context) {
          return CreateToDo();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TO DO")),
        backgroundColor: Colors.yellow[300],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () => openDialogue(context),
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: todoList[index][0],
              taskStatus: todoList[index][1],
              onChanged: (value) => checkboxChanged(value, index));
        },
      ),
      backgroundColor: Colors.yellow[200],
    );
  }
}
