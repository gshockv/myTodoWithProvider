import 'package:flutter/material.dart';
import 'dart:collection';

import 'package:todo_with_provider/model/task.dart';

class TodosModel extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: "Finith the TODO App"),
    Task(title: "Write a blog post"),
    Task(title: "Learn Flutter"),
    Task(title: "Wash a car"),
    Task(title: "Start new Flutter Project")
  ];

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_tasks);

  UnmodifiableListView<Task> get incompleteTasks => UnmodifiableListView(
    _tasks.where((todo) => !todo.completed)
  );

  UnmodifiableListView<Task> get completedTasks => UnmodifiableListView(
    _tasks.where((todo) => todo.completed)
  );

  void addTodo(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTodo(Task task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
