import 'dart:convert';

import 'package:flutter/material.dart';

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {

  Future<int> getData() async {
    await Future.delayed(const Duration(seconds: 3));
    return 15;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child:
        FutureBuilder<int>(
            future: getData(),
            // initialData: 12,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int data = snapshot.data!;
                return Text(
                  '🎉 ️$data',
                  style: const TextStyle(fontSize: 50),
                );
              } else {
                return const Text(
                  '⌛️ waiting',
                  style: TextStyle(fontSize: 40),
                );
              }
            }),
      ),
    );
  }
}

// Future<int> getData() async {
//   final result = http.get(Uri.parse('https://www.randomnumberapi.com/api/v1.0/random'));
//   await Future.delayed(const Duration(seconds: 3));
//   final body = jsonDecode(result.body);
//   int randomNumber = (body as List).first;
//   return randomNumber;
// }
