import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_with_provider/model/task.dart';
import 'package:todo_with_provider/provider/todosModel.dart';
import 'package:todo_with_provider/ui/utils/appColors.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskTitleController = TextEditingController();
  bool completedStatus = false;

  @override
  void dispose() {
    taskTitleController.dispose();
    super.dispose();
  }

  _onAdd() {
    final String textVal = taskTitleController.text;
    final bool completed = completedStatus;
    if (textVal.isNotEmpty) {
      final Task todo = Task(
        title: textVal,
        completed: completed
      );
      Provider.of<TodosModel>(context, listen: false).addTodo(todo);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: _createForm()
    );
  }

  Widget _createAppBar() {
    return AppBar(
      backgroundColor: Color(AppColors.primaryDarkColor),
      elevation: 0,
      title: Text(
        "Add Task",
        style: GoogleFonts.orbitron(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 3.2,
          color: Colors.deepOrange
        ),
      ),
    );
  }

  Widget _createForm() {
    return Container(
      color: Color(AppColors.primaryLightColor),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(controller: taskTitleController),
                  CheckboxListTile(
                    value: completedStatus,
                    onChanged: (checked) => setState(() {
                      completedStatus = checked;
                    }),
                    title: Text(
                      "Complete?",
                    ),
                  ),
                  RaisedButton(
                    child: Text("Add"),
                    onPressed: _onAdd,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
