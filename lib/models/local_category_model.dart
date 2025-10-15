import 'package:todo_app/entities/category_entitity.dart';

final class LocalCategoryModel extends CategoryEntity {
  LocalCategoryModel({
    required super.name,
    required super.color,
    required this.id,
  });
  final String id;

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'color': {
        'red': color.red,
        'green': color.green,
        'blue': color.blue,
        'alpha': color.alpha,
      },
    };
  }

  @override
  String toString() {
    final result = '$runtimeType{\nid: $id,\nname: $name, \ncolor: $color}';
    return result;
  }
}
