import 'package:flutter/material.dart';
import 'package:todo_list/constant/colors.dart';
import 'package:todo_list/models/todo.dart';

class ToDoItem extends StatelessWidget {
  ToDoItem({Key? key, required this.todoo, this.onChange, this.onDelete})
      : super(key: key);

  final Todo todoo;

  final onChange;
  final onDelete;

  Widget listTileTodo() {
    return ListTile(
      onTap: () {
        onChange(todoo);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      tileColor: Colors.white,
      leading: Icon(
        todoo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
        color: tdblue,
      ),
      title: Text(
        todoo.todotext,
        style: TextStyle(
          fontSize: 16,
          color: tdBlack,
          decoration: todoo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: deleteIconButton(),
    );
  }

  Widget deleteIconButton() {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        color: Colors.white,
        iconSize: 18,
        icon: const Icon(Icons.delete),
        onPressed: () {
          onDelete(todoo.id);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: listTileTodo(),
    );
  }
}
