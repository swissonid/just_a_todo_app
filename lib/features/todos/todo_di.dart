import 'package:clean_cubit_todo_app/features/todos/domain/create_todo_use_case.dart';
import 'package:get_it/get_it.dart';

import 'data/in_memory_todo_repository.dart';
import 'domain/delete_todo_use_case.dart';
import 'domain/get_all_todos_use_case.dart';
import 'domain/save_todo_use_case.dart';
import 'domain/todo_repository.dart';
import 'presentation/todo_page_bloc.dart';

void initTodoModule(GetIt getIt) {
  getIt.registerSingleton<TodoRepository>(InMemoryTodoRepository());
  getIt.registerFactory(() => DeleteTodoUseCase(getIt()));
  getIt.registerFactory(() => SaveTodoUseCase(getIt()));
  getIt.registerFactory(() => CreateTodoUseCase());
  getIt.registerFactory(() => GetAllTodosUseCase(getIt()));
  getIt.registerFactory(() => TodoPageBloc(getIt(), getIt(), getIt(), getIt()));
}
