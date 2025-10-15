import 'package:todo_app/entities/task_entitity.dart';

abstract class TaskRepository {
  Future<TaskEntity> createTask({required TaskEntity task});
  Future<TaskEntity> editTask({required TaskEntity task});
  Future<bool> deleteTask({required TaskEntity task});
  Future<List<TaskEntity>> loadTasks();
  Future<TaskEntity> toggleTaskStatus({required TaskEntity task, required bool isDone});
}
