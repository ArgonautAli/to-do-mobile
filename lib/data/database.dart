import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todoList = [];
// reference our box
  final _myBox = Hive.box("mybox");

// run this method if this is the 1st time ever opening this app
  void createInititalData() {
    todoList = [
      ["Lets get started", true]
    ];
  }

// Load the data
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

// update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", todoList);
  }
}
