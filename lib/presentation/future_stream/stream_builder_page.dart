import 'package:flutter/material.dart';

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({super.key});

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  late Stream<int> getStream;

  @override
  void initState() {
    getStream = countForTen();
    super.initState();
  }

  Stream<int> countForTen() async* {
    await Future.delayed(const Duration(seconds: 3));
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('StreamBuilder'),
      ),
      body: Center(
        child:
        StreamBuilder<int>(
            stream: getStream,
            builder: (context, snapshot) {
              if (ConnectionState.waiting == snapshot.connectionState) {
                return const Text(
                  '⌛️ waiting',
                  style: TextStyle(fontSize: 40),
                );
              } else if (snapshot.hasData) {
                int data = snapshot.data!;
                return Text(
                  '🎉 ️$data',
                  style: const TextStyle(fontSize: 50),
                );
              } else {
                return const Text(
                  'No data',
                  style: TextStyle(fontSize: 40),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            getStream = countForTen();
          });
        },
      ),
    );
  }
}
