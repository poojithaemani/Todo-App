import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:todo_app/repository/category_repository.dart';
import 'package:todo_app/entities/category_entitity.dart';

final class CategoryRepoImpl extends CategoryRepository {
  @override
  Future<CategoryEntity> createCategory({
    required CategoryEntity category,
  }) async {
    // TODO: implement createCategory
    final input = category;
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final categoryFile = File('${appDocDir.path}/categories');
    if (!(await categoryFile.exists())) {
      await categoryFile.create();
    }

    await categoryFile.writeAsString(
      input.toMap().toString(),
      mode: FileMode.append,
    );
    return input;
  }

  @override
  Future<bool> deleteCategory({required CategoryEntity category}) async {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<CategoryEntity> editCategory({
    required CategoryEntity category,
  }) async {
    // TODO: implement editCategory
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }
}
