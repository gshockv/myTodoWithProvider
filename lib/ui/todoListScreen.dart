import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_with_provider/ui/addTaskScreen.dart';
import 'package:todo_with_provider/ui/allTasksTab.dart';
import 'package:todo_with_provider/ui/completedTasksTab.dart';
import 'package:todo_with_provider/ui/incompleteTasksTab.dart';
import 'package:todo_with_provider/ui/utils/appColors.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ToDoListScreenState();
  }
}

class _ToDoListScreenState extends State<ToDoListScreen> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _createAppBar(),
        body: _createBody(),
      ),
    );
  }

  Widget _createAppBar() {
    return AppBar(
      backgroundColor: Color(AppColors.primaryDarkColor),
      elevation: 0,
      title: Text(
        "TODO List",
        style: GoogleFonts.orbitron(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 3.2,
          color: Colors.deepOrange
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.playlist_add,
            size: 32,
          ),
          onPressed: _onAddClick,
        )
      ],
      bottom: TabBar(
        controller: controller,
        tabs: <Widget>[
          Tab(text: "All"),
          Tab(text: "Incomplete"),
          Tab(text: "Completed")
        ],
      ),
    );
  }

  Widget _createBody() {
    return Container(
      color: Color(AppColors.primaryLightColor),
      child: TabBarView(
        controller: controller,
        children: <Widget>[
          AllTasksTab(),
          IncompleteTasksTab(),
          CompletedTasksTab()
        ],
      ),
    );
  }

  _onAddClick() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => AddTaskScreen()
    ));
  }
}
