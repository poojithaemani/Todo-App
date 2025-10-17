import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/models/local_category_model.dart';
import 'package:todo_app/models/local_task_model.dart';
import 'package:todo_app/widgets/category_tag.dart';
import 'package:todo_app/widgets/task_list_item.dart';
import 'package:uuid/uuid.dart';
import 'package:todo_app/repository/category_repo_impl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Hello World!'),
              const SizedBox(height: 20),
              TaskListItem(taskName: createRandomTask()),
              TaskListItem(taskName: createRandomTask()),
              TaskListItem(taskName: createRandomTask()),
              TaskListItem(taskName: createRandomTask()),
              TaskListItem(taskName: createRandomTask()),
              CategoryTag(category: createRandomCategory()),
              CategoryTag(category: createRandomCategory()),
              CategoryTag(category: createRandomCategory()),

              FilledButton(
                onPressed: () async {
                  print('button pressed');
                  // Create a random category
                  final randomCategory = createRandomCategory();
                  print(
                    'Created category: \n${randomCategory.name} with color ${randomCategory.color}',
                  );

                  final categoryRepo = CategoryRepoImpl();
                  await categoryRepo.createCategory(category: randomCategory);
                  print('Category saved to repository.');
                },
                child: const Text('Add a random category'),
              ),
              FilledButton(
                onPressed: () async {
                  print('button pressed2');
                  // Create a random category

                  final categoryRepo = CategoryRepoImpl();
                  await categoryRepo.getAllCategories();
                  print('Category saved to repository.');
                },
                child: const Text('load category'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

LocalTaskModel createRandomTask() {
  late final LocalTaskModel result;
  result = LocalTaskModel(
    title: Uuid().v4(),
    deadline: DateTime.now(),
    isDone: Random().nextBool(),
    category: createRandomCategory(),
    id: Uuid().v4(),
  );
  return result;
}

LocalCategoryModel createRandomCategory() {
  late final LocalCategoryModel result;
  final String randomName = Uuid().v4();
  final String randomId = Uuid().v4();
  final Color randomColor = Color.fromARGB(
    255,
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255),
  );
  result = LocalCategoryModel(
    name: randomName,
    color: randomColor,
    id: randomId,
  );
  return result;
}
