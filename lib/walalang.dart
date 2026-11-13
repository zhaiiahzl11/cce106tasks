import 'package:flutter/material.dart';

class walalang extends StatelessWidget {
  walalang({super.key});

  // widgets as variables (no parameters)
  final nameStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
  final smallStyle = const TextStyle(fontSize: 14);
  final headingStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  // data for the subject cards (loop below reuses one function)
  final subjects = const [
    ['Mobile App Development', 'Mr. Smith', 'Mon/Wed 10:00 - 11:30 AM'],
    ['Database Systems', 'Mrs. Garcia', 'Tue/Thu 1:00 - 2:30 PM'],
    ['Operating Systems', 'Dr. Lee', 'Fri 9:00 - 12:00 PM'],
  ];

  // PROFILE HEADER (Row > CircleAvatar + Column)
  Widget buildProfileHeader() => Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/pfp.jpg'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Zhaira Nicole D. Lestojas', style: nameStyle),
            Text('ID: 557-000', style: smallStyle),
            Text('BSIT 3RD YEAR', style: smallStyle),
          ],
        ),
      ],
    ),
  );

  // reusable ListTile (used 3 times)
  Widget buildInfoTile(IconData icon, String text) =>
      ListTile(leading: Icon(icon), title: Text(text));

  // STUDENT INFORMATION CARD
  Widget buildInfoCard() => Card(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    elevation: 4,
    child: Column(
      children: [
        buildInfoTile(Icons.email, 'zhaiiahzl@gmail.com'),
        buildInfoTile(Icons.phone, '+63 912 345 6789'),
        buildInfoTile(Icons.home, '123 R. Castillo, Davao City, Philippines'),
      ],
    ),
  );

  // reusable subject card (used 3 times through the loop)
  Widget buildSubjectCard(String name, String instructor, String schedule) =>
      Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 16)),
              Text('Instructor: $instructor', style: smallStyle),
              Text('Schedule: $schedule', style: smallStyle),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              print('Logout clicked');
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          buildProfileHeader(),
          buildInfoCard(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Text('Subjects', style: headingStyle),
          ),
          for (var s in subjects) buildSubjectCard(s[0], s[1], s[2]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Add Subject Clicked!');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
