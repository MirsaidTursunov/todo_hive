import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_hive/data/model/task.dart';

class AddTasksPage extends StatefulWidget {
  const AddTasksPage({super.key});

  @override
  State<AddTasksPage> createState() => _AddTasksPageState();
}

class _AddTasksPageState extends State<AddTasksPage> {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  late Box<Task> tasksBox;

  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box('todo_box');
  }

  void onAddTask() {
    if (titleController.text.isNotEmpty) {
      final newTask = Task(titleController.text, false, subtitleController.text);
      tasksBox.add(newTask);
      Navigator.pop(context);
      titleController.clear();
      return;
    }
  }

  void onUpdateTask(int index, Task task) {
    tasksBox..putAt(index, Task(task.title, !task.completed, subtitleController.text));
    return;
  }

  void onDeleteTask(int index) {
    tasksBox.deleteAt(index);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                  label: Text('Todo title'), hintText: 'Develop amazing app '),
            ),
            const SizedBox(
              height: 36,
            ),
            TextFormField(
              controller: subtitleController,
              decoration: const InputDecoration(
                label: Text('Todo subtitle'),
              ),
            ),
            MaterialButton(
              color: Colors.black,
              height: 50,
              minWidth: double.infinity,
              onPressed: onAddTask,
              child: const Text(
                'Add todo',
                style: TextStyle(color: Colors.white),

                // widget.todo == null ? 'Add todo' : 'Update Todo',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
