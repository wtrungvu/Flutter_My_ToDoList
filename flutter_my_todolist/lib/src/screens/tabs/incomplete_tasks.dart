import 'package:flutter/material.dart';
import 'package:flutter_my_todolist/src/providers/todos_model.dart';
import 'package:flutter_my_todolist/src/screens/widgets/task_list.dart';
import 'package:provider/provider.dart';

class IncompleteTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodosModel>(
        builder: (context, todos, child) => TaskList(
          tasks: todos.incompleteTasks,
        ),
      ),
    );
  }
}
