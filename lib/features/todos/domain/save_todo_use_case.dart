import 'todo_model.dart';
import 'todo_repository.dart';

class SaveTodoUseCase {
  final TodoRepository _todoRepository;

  SaveTodoUseCase(this._todoRepository);

  Future<void> call(AnyTodo todo) async {
    await _todoRepository.save(todo);
  }
}
