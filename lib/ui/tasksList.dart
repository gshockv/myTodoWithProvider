import 'package:flutter/material.dart';
import 'package:todo_with_provider/model/task.dart';
import 'package:todo_with_provider/ui/taskListItem.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;

  const TasksList({@required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getTasksListItems(),
    );
  }

  List<Widget> _getTasksListItems() {
    return tasks.map((todo) => TaskListItem(task: todo,)).toList();
  }
}
