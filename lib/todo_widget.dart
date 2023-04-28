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
        padding: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          color: Colors.cyan[600],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.highlight_remove_rounded,
              color: Colors.purple[900],
            )
          ],
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => model.removeTodo(todo),
      child: GestureDetector(
        onTap: () => model.toggleTodo(todo),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            color: isChecked ? Colors.green[100] : Colors.blue[100],
            borderRadius: BorderRadius.circular(10.0),
          ),
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
      color: Colors.purple[900],
    );
  }
}
