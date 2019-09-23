import 'package:flutter/material.dart';
import 'package:flutter_my_todolist/src/models/task.dart';
import 'package:flutter_my_todolist/src/providers/task_list_provider.dart';
import 'package:provider/provider.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  TaskListItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: Colors.green,
        value: task.completed,
        onChanged: (bool checked) {
          Provider.of<TaskListProvider>(context, listen: false)
              .toggleTodo(task);
        },
      ),
      title: Text(task.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          Provider.of<TaskListProvider>(context, listen: false)
              .deleteTodo(task);
        },
      ),
    );
  }
}
