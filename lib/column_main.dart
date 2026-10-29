import 'package:flutter/material.dart';

class ColumnMain extends StatelessWidget {
  const ColumnMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TASK 5 - LESTOJAS'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 90, height: 90, color: Colors.red),
            Container(width: 80, height: 80, color: Colors.yellow),
            Container(width: 70, height: 70, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
