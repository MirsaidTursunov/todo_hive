import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_hive/data/model/task.dart';
import 'package:todo_hive/presentation/add_tasks/add_tasks_page.dart';
import 'package:todo_hive/presentation/home/widget/task_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box<Task> tasksBox;

  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box('todo_box');
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: tasksBox.listenable(),
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: const Text('Hive ToDo'),
            ),
            body: tasksBox.isEmpty
                ? const Center(
                    child: Text("No Tasks"),
                  )
                : ListView.separated(
                    itemCount: tasksBox.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final task = tasksBox.get(index);
                      return TaskWidget(
                        onDeletePressed: () {},
                        title: task?.title ?? '',
                        description: task?.description ?? '',
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                  ),
            bottomNavigationBar: SafeArea(
              minimum: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTasksPage()));
                },
                child: const Text('Add task'),
              ),
            ),
          );
        });
  }
}
