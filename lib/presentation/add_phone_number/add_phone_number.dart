import 'package:flutter/material.dart';
import 'package:todo_hive/local_source/local_source.dart';
import 'package:todo_hive/main.dart';

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({super.key});

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  TextEditingController phonNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Phone Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              controller: phonNumberController,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                LocalSource(box).setPhoneNumber(phonNumberController.text);
                setState(() {});
              },
              child: const Text('Add Number'),
            ),
            const SizedBox(height: 12),
            ListTile(
              title: Text(
                LocalSource(box).phoneNumber,
                style: const TextStyle(fontSize: 18),
              ),
              trailing: IconButton(
                onPressed: () {
                  LocalSource(box).deletePhoneNumber();
                  setState(() {});
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
