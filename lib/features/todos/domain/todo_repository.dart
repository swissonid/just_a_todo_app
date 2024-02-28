import 'todo_model.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<Todo> save(AnyTodo todo);
  Future<void> remove(Todo todo);
  Stream<List<Todo>> todos();
}
