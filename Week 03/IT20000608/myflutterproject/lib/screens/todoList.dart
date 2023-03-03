import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myflutterproject/model/task.dart';
import 'package:myflutterproject/widgets/todoWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final taskList = Task.todoList();
  TextEditingController _todoController = TextEditingController();
  String task = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            //Listview of the Tasks
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "To - Do List",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  for (Task task in taskList)
                    ToDoTask(
                      todo: task,
                      onToDoChange: _handleToDoChange,
                      onDeleteItem: _handleOnDeleteItem,
                    ),
                ],
              ),
            ),
            //Text field to add the new task
            Container(
              decoration: BoxDecoration(
                  color: Colors.brown[50],
                  borderRadius: BorderRadius.circular(2)),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration(hintText: "Add a new Task..."),
              ),
            ),
            //Button to add a new Task
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ElevatedButton(
                child: Text(
                  "Add Task",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  //_addToDoTask(_todoController.text);
                  FirebaseFirestore.instance.collection("Todo").add({
                    "task": _todoController.text,
                  }); //add tasks to firebase
                },
                style: ElevatedButton.styleFrom(primary: Colors.brown[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleToDoChange(Task todo) {
    setState(() {
      todo.state = !todo.state;
    });
  }

  void _handleOnDeleteItem(String id) {
    setState(() {
      taskList.removeWhere((element) => element.id == id);
    });
  }

  void _addToDoTask(String todo) {
    setState(() {
      taskList.add(Task(
          id: DateTime.now().millisecondsSinceEpoch.toString(), text: todo));
    });
    _todoController.clear();
  }
}
