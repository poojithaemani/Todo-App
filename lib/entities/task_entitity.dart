import 'package:todo_app/entities/category_entitity.dart';

enum TaskPriority { low, medium, high }

abstract class TaskEntity {
  final String title;
  final DateTime deadline;
  final bool isDone;
  final TaskPriority priority;
  final CategoryEntity category;

  TaskEntity({
    required this.title,
    required this.deadline,
    required this.isDone,
    required this.priority,
    required this.category,
  });
}