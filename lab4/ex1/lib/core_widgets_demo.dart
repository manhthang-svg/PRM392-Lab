import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Excercise 1 - Core Widgets")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Headline Text
            const Text(
              "Welcome to Flutter",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // Icon
            const Icon(Icons.favorite, size: 50),

            const SizedBox(height: 16),

            // Network Image
            Image.network("https://picsum.photos/250", height: 200),

            const SizedBox(height: 16),

            // Card + ListTile
            const Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Phung Manh Thang"),
                subtitle: Text("Flutter Student"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
