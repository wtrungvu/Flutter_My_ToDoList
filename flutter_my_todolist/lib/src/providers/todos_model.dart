import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_my_todolist/src/models/task.dart';

class TodosModel extends ChangeNotifier {
  final List<Task> _taskList = [
    Task(title: 'Finish the app'),
    Task(title: 'Write a blog post'),
    Task(title: 'Share with community'),
  ];

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_taskList);
  UnmodifiableListView<Task> get incompleteTasks =>
      UnmodifiableListView(_taskList.where((todo) => !todo.completed));
  UnmodifiableListView<Task> get completedTasks =>
      UnmodifiableListView(_taskList.where((todo) => todo.completed));

  void addTodo(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  void toggleTodo(Task task) {
    final taskIndex = _taskList.indexOf(task);
    _taskList[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }
}
