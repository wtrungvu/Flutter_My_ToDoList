import 'package:flutter/material.dart';
import 'package:flutter_my_todolist/src/models/task.dart';
import 'package:flutter_my_todolist/src/providers/todos_model.dart';
import 'package:provider/provider.dart';

class AddNewTaskScreen extends StatefulWidget {
  @override
  _AddNewTaskScreenState createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final _controllerTitleTask = TextEditingController();
  bool _completedStatus = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerTitleTask.dispose();
  }

  void _onAdd() {
    final String textValue_TitleTask = _controllerTitleTask.text;
    final bool completed = _completedStatus;

    // Title Task have text ?
    if (textValue_TitleTask.isNotEmpty) {
      final Task todo = Task(
        title: textValue_TitleTask,
        completed: completed,
      );

      Provider.of<TodosModel>(context, listen: false).addTodo(todo);
      Navigator.pop(
          context); // Add completed, Back to HomeScreen display All Task
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Task")),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _controllerTitleTask,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Title Task',
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                    ),
                    hintText: 'What your task?',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _controllerTitleTask.clear(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "If your task is completed, checked box!",
                      ),
                      Text(
                        "Or if your task is not completed, uncheck (emty) box!",
                      ),
                    ],
                  ),
                ),
                CheckboxListTile(
                  activeColor: Colors.green,
                  value: _completedStatus,
                  onChanged: (isChecked) =>
                      setState(() => _completedStatus = isChecked),
                  title: Text('Your task is completed?'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  width: double.infinity,
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'ADD NEW TASK',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    elevation: 8.0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                    ),
                    onPressed: () {
                      _onAdd();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
