import 'dart:async';

import 'package:clean_cubit_todo_app/features/todos/domain/todo_model.dart';

import '../domain/todo_repository.dart';

class InMemeryTodoRepository implements TodoRepository {
  final List<Todo> _todos = [];
  final streamController = StreamController<List<Todo>>.broadcast();

  @override
  Future<List<Todo>> getTodos() {
    return Future.value(_todos);
  }

  @override
  Future<void> remove(Todo todo) {
    _todos.remove(todo);
    streamController.add(_todos);
    return Future.value();
  }

  @override
  Future<Todo> save(AnyTodo todo) {
    final newTodo = Todo(
      id: '${_todos.length + 1}',
      description: todo.description,
      isCompleted: todo.isCompleted,
      title: todo.title,
    );
    _todos.add(newTodo);
    streamController.add(_todos);
    return Future.value(newTodo);
  }

  @override
  Stream<List<Todo>> todos() {
    return streamController.stream;
  }
}
