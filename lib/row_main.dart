import 'package:flutter/material.dart';

class RowMain extends StatelessWidget {
  const RowMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TASK 5 - LESTOJAS'), centerTitle: true),
      body: Center(
        child: Row(
          // Options: center, spaceAround, spaceBetween, spaceEvenly, start, end
          mainAxisAlignment:
              MainAxisAlignment.center, // <-- change this value only
          children: [
            Container(width: 90, height: 90, color: Colors.red), // Container
            Container(width: 80, height: 80, color: Colors.yellow), // Container
            Container(width: 70, height: 70, color: Colors.blue), // Container
          ],
        ), // Row
      ), // Center
    ); // Scaffold
  }
}
