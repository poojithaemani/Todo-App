import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/models/local_category_model.dart';
import 'package:todo_app/repository/category_repo_impl.dart';
import 'package:uuid/uuid.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Hello World!'),
              const SizedBox(height: 20),
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
            ],
          ),
        ),
      ),
    );
  }
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
