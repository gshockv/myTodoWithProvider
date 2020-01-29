import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_provider/provider/todosModel.dart';
import 'package:todo_with_provider/ui/tasksList.dart';

class IncompleteTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodosModel>(
        builder: (context, todos, child) => TasksList(tasks: todos.incompleteTasks)
      )
    );
  }
}