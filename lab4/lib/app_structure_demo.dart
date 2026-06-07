import 'package:flutter/material.dart';

class AppStructureDemo extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const AppStructureDemo({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Scaffold implementation
    return Scaffold(
      // 2. AppBar implementation
      appBar: AppBar(
        title: const Text('Exercise 4: App Structure'),
        backgroundColor: Colors.purple,
      ),
      // 3. Body implementation
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.settings_display, size: 80, color: Colors.purple),
            const SizedBox(height: 20),
            const Text(
              'App Structure with Scaffold',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Current Theme: ${isDarkMode ? "Dark Mode" : "Light Mode"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            // Theme toggle button
            ElevatedButton.icon(
              onPressed: onThemeToggle,
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              label: Text(isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
      // 4. FloatingActionButton implementation
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Floating Action Button Clicked!')),
          );
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
