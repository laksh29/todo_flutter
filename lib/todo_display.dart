import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todo/todo.dart';
import 'package:todo/todo_dialog.dart';
import 'package:todo/todo_widget.dart';
import 'package:todo/todos.dart';

class DiaplayTodo extends StatelessWidget {
  late BuildContext context;
  late Todos model;
  DiaplayTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Todos>(
      builder: (context, child, todosModel) {
        this.context = context;
        model = todosModel;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Todo"),
          ),
          body: _buildTodoContext(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _buildDialogNewTodo();
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  _buildTodoContext() {
    if (model == null || model.todos.isEmpty) {
      return _buildPlaceHolder();
    } else {
      return ListView.builder(
        itemCount: model.todosCount,
        itemBuilder: (BuildContext context, int index) {
          // print("${model.todosCount}");
          return TodoItem(model, model.todos[index]);
        },
      );
    }
  }

  _buildPlaceHolder() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          "Press FAB to add new ToDo",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<Null> _buildDialogNewTodo() async {
    await showDialog(
      context: context,
      builder: (context) {
        return DialogTodo(model);
      },
    );
  }
}
