import 'package:flutter/material.dart';
import 'package:myflutterproject/model/task.dart';

class ToDoTask extends StatelessWidget {
  final Task todo;
  final onToDoChange;
  final onDeleteItem;

  const ToDoTask(
      {Key? key,
      required this.todo,
      required this.onDeleteItem,
      required this.onToDoChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        onTap: () {
          onToDoChange(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        tileColor: Colors.green[100],
        leading: Icon(
          todo.state ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green,
        ),
        title: Text(
          todo.text!,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: todo.state ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(2),
          ),
          child: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
            color: Colors.white,
            iconSize: 15,
          ),
        ),
      ),
    );
  }
}
