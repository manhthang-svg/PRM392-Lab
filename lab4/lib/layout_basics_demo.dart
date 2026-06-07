import 'package:flutter/material.dart';

class LayoutBasicsDemo extends StatelessWidget {
  LayoutBasicsDemo({super.key});

  final List<String> _items = List.generate(20, (index) => 'Movie Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3: Layout Basics'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding basics
        child: Column( // Column basics
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row basics
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.movie, size: 40, color: Colors.orange),
                  Text(
                    'Movie List',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.list, size: 40, color: Colors.orange),
                ],
              ),
            ),
            const SizedBox(height: 16.0), // SizedBox for spacing

            const Text(
              'Now Playing',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),

            // ListView basics inside Expanded
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(_items[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
