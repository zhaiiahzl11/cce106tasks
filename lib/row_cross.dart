import 'package:flutter/material.dart';

class RowCross extends StatelessWidget {
  const RowCross({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TASK 5 - LESTOJAS'), centerTitle: true),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
