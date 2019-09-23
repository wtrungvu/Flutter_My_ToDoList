import 'package:flutter/material.dart';

class Task {
  String title;
  bool completed;

  Task({@required this.title, this.completed = false});

  // Checbox switch complete to incompleted or opposite
  toggleCompleted() {
    completed = !completed;
  }
}
