import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Integration')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/male1.jpg', // Top: male
              width: 150,
              height: 150,
            ),
            Image.asset(
              'assets/female.jpg', // Middle: female
              width: 150,
              height: 150,
            ),
            Image.asset(
              'assets/male2.jpg', // Bottom: another male
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
