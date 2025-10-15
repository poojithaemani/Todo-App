import 'dart:ui';

class CategoryEntity {
  final String name;
  final Color color;

  CategoryEntity({required this.name, required this.color});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'color': {
        'red': color.red,
        'green': color.green,
        'blue': color.blue,
        'alpha': color.alpha,
      },
    };
  }
}
