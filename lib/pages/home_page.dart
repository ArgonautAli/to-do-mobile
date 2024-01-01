import "package:flutter/material.dart";
import "package:to_do_app/utils/create_todo.dart";
import "package:to_do_app/utils/todo_tile.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List todoList = [
    ["Love Ishita", false],
    ["Go to gym", true]
  ];

  void checkboxChanged(bool? status, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  void openDialogue(context) {
    showDialog(
        context: context,
        builder: (context) {
          return CreateToDo(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTodo(int index) {
    setState(() {
      todoList.removeAt(index);
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
              onChanged: (value) => checkboxChanged(value, index),
              onDelete: (context) => deleteTodo(index));
        },
      ),
      backgroundColor: Colors.yellow[200],
    );
  }
}
