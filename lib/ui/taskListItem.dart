import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_provider/model/task.dart';
import 'package:todo_with_provider/provider/todosModel.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.completed,
        onChanged: (bool checked) {
          Provider.of<TodosModel>(context, listen: false).toggleTodo(task);
        },
      ),
      title: Text(
        task.title,
        style: TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          Provider.of<TodosModel>(context, listen: false).deleteTodo(task);
        },
      ),
    );
  }
}
