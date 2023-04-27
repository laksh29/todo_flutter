import 'package:scoped_model/scoped_model.dart';
import 'package:todo/todo.dart';

class Todos extends Model {
  List<Todo> _todosList = [];
  Set<Todo> _checkedTodos = Set<Todo>();

  List<Todo> get todos => _todosList;

  int get todosCount => _todosList.length;

  void addTodo(Todo todo, {int position = 0}) {
    _todosList.insert(position, todo);
    print(_todosList);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    removeTodo(todo);

    if (_checkedTodos.contains(todo)) {
      _markTodoAsUnChecked(todo);
    } else {
      _markTodoAsChecked(todo);
    }
    notifyListeners();
  }

  void _markTodoAsChecked(Todo todo) {
    _todosList.insert(_todosList.length, todo);
    _checkedTodos.add(todo);
  }

  void _markTodoAsUnChecked(Todo todo) {
    _todosList.insert(0, todo);
    _checkedTodos.remove(todo);
  }

  void removeTodo(Todo todo) {
    _todosList.remove(todo);
    notifyListeners();
  }

  bool isChecked(Todo todo) {
    return _checkedTodos.contains(todo);
  }
}
