import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack Widget')),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 100, height: 100, color: Colors.red),
            Container(width: 90, height: 90, color: Colors.blue),
            Container(width: 80, height: 80, color: Colors.green),
            Container(width: 70, height: 70, color: Colors.yellow),
            Container(width: 60, height: 60, color: Colors.black),
            Container(width: 50, height: 50, color: Colors.purple),
          ],
        ),
      ),
    );
  }
}
