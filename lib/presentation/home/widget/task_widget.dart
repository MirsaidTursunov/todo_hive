import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final VoidCallback onDeletePressed;
  final String title;
  final String description;

  const TaskWidget({
    Key? key,
    required this.onDeletePressed,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.1)),
        child: ListTile(
          leading: IconButton(
            onPressed: onDeletePressed,
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          subtitle: Text(
            description,
            style: const TextStyle(color: Colors.black87, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
