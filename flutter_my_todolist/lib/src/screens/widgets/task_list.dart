import 'package:flutter/material.dart';
import 'package:flutter_my_todolist/src/models/task.dart';
import 'task_list_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> taskList;

  TaskList({@required this.taskList});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTasks(),
    );
  }

  List<Widget> getChildrenTasks() {
    return taskList.map((taskItem) => TaskListItem(task: taskItem)).toList();
  }
}
