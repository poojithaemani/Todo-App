import 'package:flutter/material.dart';
import 'package:todo_app/entities/category_entitity.dart';

class CategoryTag extends StatelessWidget {
  const CategoryTag({super.key, required this.category});
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 249, 250, 251),
        border: Border.all(color: Color.fromARGB(255, 229, 231, 235)),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          ColoredBox(
            color: category.color,
            child: SizedBox(width: 4, height: 24),
          ),
          Text(category.name),
        ],
      ),
    );
  }
}
