sealed class AnyTodo {
  final String title;
  final String description;
  final bool isCompleted;

  const AnyTodo({
    required this.title,
    required this.description,
    required this.isCompleted,
  });
}

class UnsavedTodo extends AnyTodo {
  const UnsavedTodo({
    required super.title,
    required super.description,
    super.isCompleted = false,
  });

  UnsavedTodo copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return UnsavedTodo(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'UnsavedTodo{title: $title, description: $description, isCompleted: $isCompleted}';
  }

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UnsavedTodo &&
        other.title == title &&
        other.description == description &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode =>
      title.hashCode ^ description.hashCode ^ isCompleted.hashCode;
}

class Todo extends AnyTodo {
  final String id;

  const Todo({
    required this.id,
    required super.title,
    required super.description,
    required super.isCompleted,
  });

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, isCompleted: $isCompleted}';
  }

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isCompleted.hashCode;
}
