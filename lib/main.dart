import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_provider/provider/todosModel.dart';
import 'package:todo_with_provider/ui/todoListScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context) => TodosModel(),
      child: TODOApp()
    )
  );
}

class TODOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: ToDoListScreen(),
    );
  }
}
