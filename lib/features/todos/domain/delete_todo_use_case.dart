import 'todo_model.dart';
import 'todo_repository.dart';

class DeleteTodoUseCase {
  final TodoRepository _todoRepository;

  DeleteTodoUseCase(this._todoRepository);

  Future<void> call(Todo todo) async {
    await _todoRepository.remove(todo);
  }
}
