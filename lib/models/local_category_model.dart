import 'dart:ui';

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

  static LocalCategoryModel fromMap (Map<String, dynamic>map){
    final result = LocalCategoryModel(name: map['name'], color: Color.from(alpha: map ['color']['alpha']/255, red: map ['color']['red']/255 , green: map ['color']['green']/255, blue: map ['color']['blue']/255), id: map['id']);
    return result;

  }
}
