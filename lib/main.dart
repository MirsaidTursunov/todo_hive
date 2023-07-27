import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_hive/presentation/future_stream/future_builder_page.dart';
import 'package:todo_hive/presentation/future_stream/stream_builder_page.dart';
import 'package:todo_hive/presentation/home/home_page.dart';
import 'package:path_provider/path_provider.dart';

import 'data/model/task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('todo_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// Future<void> initHive() async {
//   await Hive.initFlutter();
//   Hive.registerAdapter(TaskAdapter());
//   await Hive.openBox<Task>('todo_box');
// }
