import 'package:flutter/material.dart';
import 'package:flutter_my_todolist/src/providers/todos_model.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TodosModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
