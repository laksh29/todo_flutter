import 'package:flutter/material.dart';
import 'package:todo/todo.dart';
import 'package:todo/todos.dart';

class TodoItem extends StatelessWidget {
  late BuildContext context;
  final Todo todo;
  final Todos model;
  TodoItem(this.model, this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return _buildTodoItm(todo);
  }

  _buildTodoItm(Todo todo) {
    bool isChecked = model.isChecked(todo);

    return Dismissible(
      key: Key(
        todo.id.toString(),
      ),
      background: Container(
        color: Colors.cyan[600],
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => model.removeTodo(todo),
      child: InkWell(
        onTap: () => model.toggleTodo(todo),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          color: isChecked ? Colors.green[100] : Colors.blue[100],
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [_buildTodoItemText(todo), _buildTodoItemIcon(todo)],
          ),
        ),
      ),
    );
  }

  _buildTodoItemText(Todo todo) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Text(todo.title,
          style: const TextStyle(color: Colors.black, fontSize: 22)
          // maxLines: 1,
          // overflow: TextOverflow.ellipsis,
          ),
    );
  }

  _buildTodoItemIcon(Todo todo) {
    return Icon(
      model.isChecked(todo) ? Icons.done : null,
      color: Colors.blue[900],
    );
  }
}
