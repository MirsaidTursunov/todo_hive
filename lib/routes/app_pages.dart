import 'package:flutter/material.dart';
import 'package:todo_hive/presentation/add_tasks/add_tasks_page.dart';
import 'package:todo_hive/presentation/home/home_page.dart';
import 'package:todo_hive/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.initial: (_) => const HomePage(),
    AppRoutes.addTask: (_) => const AddTasksPage(),
  };
}