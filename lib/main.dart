import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todo/todo_display.dart';
import 'package:todo/todos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter TODO',
        theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
        home: ScopedModel(
          model: Todos(),
          child: DiaplayTodo(),
        ));
  }
}
