import 'package:todo_app/entities/task_entitity.dart';

final class LocalTaskModel extends TaskEntity {
  LocalTaskModel({
    required super.title,
    required super.deadline,
    super.isDone = false,
    super.priority = TaskPriority.low,
    required super.category,
    this.isDeleted = false,
  });
  final bool isDeleted;
}
