import 'package:flutter/material.dart';
import 'package:flutter_my_todolist/src/providers/task_list_provider.dart';
import 'package:flutter_my_todolist/src/screens/widgets/task_list.dart';
import 'package:provider/provider.dart';

class CompletedTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TaskListProvider>(
        builder: (context, todos, child) => TaskList(
          taskList: todos.completedTasks,
        ),
      ),
    );
  }
}
