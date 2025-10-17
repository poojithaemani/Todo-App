import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/models/local_category_model.dart';
import 'package:todo_app/repository/category_repository.dart';
import 'package:todo_app/entities/category_entitity.dart';

final class CategoryRepoImpl extends CategoryRepository {
  @override
  Future<CategoryEntity> createCategory({
    required CategoryEntity category,
  }) async {
    try {
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final categoryFile = File('${appDocDir.path}/categories');

      // Check if file exists
      if (await categoryFile.exists()) {
        // File exists, append to it
        await categoryFile.writeAsString(
          '${json.encode(category.toMap())}\n',
          mode: FileMode.append,
        );
      } else {
        // File doesn't exist, create it and write the first entry
        await categoryFile.create(recursive: true);
        await categoryFile.writeAsString(
          '${json.encode(category.toMap())}\n',
          mode: FileMode.write,
        );
      }

      return category;
    } catch (e) {
      // Handle any file operation errors
      print('Error creating category: $e');
      rethrow; // Re-throw the error so the caller can handle it
    }
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
  Future<List<CategoryEntity>> getAllCategories() async {
    try {
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final categoryFile = File('${appDocDir.path}/categories');

      // Check if file exists
      if (await categoryFile.exists()) {
        // File exists, read its contents
        final contents = await categoryFile.readAsString();

        if (contents.isEmpty) {
          // File exists but is empty
          return [];
        } else {
          // File exists and has content - parse it
          final List<CategoryEntity> categories = [];
          final lines = contents.split('\n');
          for (final line in lines) {
            if (line.isNotEmpty) {
              try {
                print ('line loaded $line');
                final category = LocalCategoryModel.fromMap(json.decode(line));
                print ('restore category $category');
                categories.add(category);
              } catch (e) {
                print('Error parsing category line: $line, Error: $e');
                // Skip malformed lines and continue
              }
            }
          }

          return categories;
        }
      } else {
        // File doesn't exist, return empty list
        return [];
      }
    } catch (e) {
      // Handle any file operation errors
      print('Error reading categories: $e');
      return [];
    }
  }
}
