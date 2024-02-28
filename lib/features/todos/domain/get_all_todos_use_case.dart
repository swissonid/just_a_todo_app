import 'todo_model.dart';
import 'todo_repository.dart';

class GetAllTodosUseCase {
  final TodoRepository _todosRepository;

  GetAllTodosUseCase(this._todosRepository);

  Stream<List<Todo>> call() {
    return _todosRepository.todos();
  }
}
