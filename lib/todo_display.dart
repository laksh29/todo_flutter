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
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
            child: _buildTodoContext(),
          ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Instructions",
              style: TextStyle(
                color: Colors.purple[800],
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Press FAB to add new ToDo\nTap the ToDo to check it\nSwipe the Todo left to remove it",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _buildDialogNewTodo() async {
    await showDialog(
      context: context,
      builder: (context) {
        return DialogTodo(model);
      },
    );
  }
}
