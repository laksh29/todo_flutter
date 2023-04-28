import 'package:flutter/material.dart';
import 'package:todo/todo.dart';
import 'package:todo/todos.dart';

class DialogTodo extends StatefulWidget {
  final Todos model;
  const DialogTodo(this.model, {super.key});

  @override
  State<DialogTodo> createState() => _DialogTodoState();
}

class _DialogTodoState extends State<DialogTodo> {
  TextEditingController titleCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleCon = TextEditingController();
  }

  @override
  void dispose() {
    titleCon;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDialog();
  }

  _buildDialog() {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(12.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDialogText(),
          _buildDialogButton(),
        ],
      ),
    );
  }

  _buildDialogText() {
    return TextField(
      autofocus: true,
      maxLines: 1,
      controller: titleCon,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: "Play BasketBall",
      ),
    );
  }

  _buildDialogButton() {
    return Container(
      margin: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCancel(),
          buildWidth(12.0),
          _buildDone(),
        ],
      ),
    );
  }

  _buildDone() {
    return Expanded(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple[900],
      ),
      child: const Text("Add"),
      onPressed: () {
        if (titleCon.text.isNotEmpty) {
          // print(titleCon.text);
          widget.model.addTodo(
            Todo(titleCon.text),
          );
        }
        // titleCon.clear();

        Navigator.of(context).pop();
      },
    ));
  }

  _buildCancel() {
    return Expanded(
      child: TextButton(
        child: const Text("Cancel"),
        onPressed: () {
          // titleCon.clear();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  SizedBox buildWidth(double width) {
    return SizedBox(
      width: width,
    );
  }
}
