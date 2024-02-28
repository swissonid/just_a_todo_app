import 'package:clean_cubit_todo_app/features/todos/domain/todo_model.dart';

class CreateTodoUseCase {
  CreateTodoUseCase();

  UnsavedTodo call({
    required String title,
    String description = '',
  }) {
    return UnsavedTodo(
      title: title,
      description: description,
      isCompleted: false,
    );
  }
}
