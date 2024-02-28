import 'package:clean_cubit_todo_app/app_di.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/todo_model.dart';
import 'todo_page_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TodoPageBloc>(),
      child: const _TodoPageView(),
    );
  }
}

class _TodoPageView extends StatelessWidget {
  const _TodoPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.select((TodoPageBloc bloc) => bloc);
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
            stream: bloc.stream,
            builder: (context, snapshot) {
              return Text('Todos ${snapshot.data?.length ?? 0}');
            }),
      ),
      body: StreamBuilder(
          stream: bloc.stream,
          builder: (context, snapshot) {
            return _TodoList(
              todos: snapshot.data ?? [],
              onDelete: bloc.delete,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.create,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TodoList extends StatelessWidget {
  final List<Todo> todos;
  final ValueChanged<Todo> onDelete;
  const _TodoList({
    super.key,
    required this.todos,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDelete(todo);
            },
          ),
        );
      },
    );
  }
}
