import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_cubit_todo_app/features/todos/domain/create_todo_use_case.dart';
import 'package:clean_cubit_todo_app/features/todos/domain/delete_todo_use_case.dart';
import 'package:clean_cubit_todo_app/features/todos/domain/get_all_todos_use_case.dart';
import 'package:clean_cubit_todo_app/features/todos/domain/save_todo_use_case.dart';

import '../domain/todo_model.dart';

class TodoPageBloc extends Cubit<List<Todo>> {
  final DeleteTodoUseCase deleteTodoUseCase;
  final CreateTodoUseCase createTodoUseCase;
  final SaveTodoUseCase saveTodoUseCase;
  TodoPageBloc(
    GetAllTodosUseCase getAllTodosUseCase,
    this.deleteTodoUseCase,
    this.createTodoUseCase,
    this.saveTodoUseCase,
  ) : super([]) {
    getAllTodosUseCase().listen((todos) {
      todos.sort((a, b) => a.title.compareTo(b.title) * -1);
      emit(todos);
    });
  }

  Future<void> delete(Todo todo) async {
    await deleteTodoUseCase(todo);
  }

  Future<void> save(AnyTodo todo) async {
    await saveTodoUseCase(todo);
  }

  Future<void> create() {
    final newTodo = createTodoUseCase(
      title: 'New Todo ${DateTime.now().toIso8601String()}',
      description: 'Just created',
    );
    return save(newTodo);
  }
}
