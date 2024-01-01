import "package:flutter/material.dart";
import "package:to_do_app/data/database.dart";
import "package:to_do_app/utils/create_todo.dart";
import "package:to_do_app/utils/todo_tile.dart";
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();
  final _myBox = Hive.box('mybox');

  @override
  void initState() {
    // if this is first time opening app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInititalData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void checkboxChanged(bool? status, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
    db.updateDatabase();
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
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
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
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: db.todoList[index][0],
              taskStatus: db.todoList[index][1],
              onChanged: (value) => checkboxChanged(value, index),
              onDelete: (context) => deleteTodo(index));
        },
      ),
      backgroundColor: Colors.yellow[200],
    );
  }
}
