import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_my_todolist/src/models/task.dart';

class TaskListProvider extends ChangeNotifier {
  final List<Task> _taskList = [
    Task(title: 'Eat'),
    Task(title: 'Sleep'),
    Task(title: 'Coding'),
  ];

  // Show All Tasks
  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_taskList);
  // Incomplete task list: bool completed = false
  UnmodifiableListView<Task> get incompleteTasks =>
      UnmodifiableListView(_taskList.where((todo) => !todo.completed));
  // Completed task list: bool completed = true
  UnmodifiableListView<Task> get completedTasks =>
      UnmodifiableListView(_taskList.where((todo) => todo.completed));

  // Add a new task into Task List
  void addTodo(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  // Checbox switch complete to incompleted or opposite
  void toggleTodo(Task task) {
    final taskIndex = _taskList.indexOf(task);
    _taskList[taskIndex].toggleCompleted();
    notifyListeners();
  }

  // Add delete a task into Task List
  void deleteTodo(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }
}
