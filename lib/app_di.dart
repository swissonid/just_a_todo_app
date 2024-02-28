import 'package:clean_cubit_todo_app/features/todos/todo_di.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  initTodoModule(getIt);
}
