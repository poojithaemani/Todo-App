import 'package:todo_app/entities/category_entitity.dart';
import 'package:todo_app/entities/task_entitity.dart';

final class LocalTaskModel extends TaskEntity {
  LocalTaskModel({
    required super.title,
    required super.deadline,
    super.isDone = false,
    super.priority = TaskPriority.low,
    required super.category,
    this.isDeleted = false,
    required String id,
  });
  final bool isDeleted;

  LocalTaskModel copyWith({
    String? title,
    DateTime? deadline,
    bool? isDone,
    TaskPriority? priority,
    CategoryEntity? category,
  }) {
    return LocalTaskModel(
      title: title ?? this.title,
      deadline: deadline ?? this.deadline,
      isDone: isDone ?? this.isDone,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      id: '',
    );
  }
}
