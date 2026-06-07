import 'package:flutter/material.dart';
import 'core_widgets_demo.dart';
import 'input_controls_demo.dart';
import 'layout_basics_demo.dart';
import 'app_structure_demo.dart';
import 'debug_fix_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Trạng thái quản lý chế độ Dark Mode cho toàn bộ ứng dụng
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Lab 4',
      debugShowCheckedModeBanner: false,
      // Định nghĩa ThemeData cho Light Mode
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // Định nghĩa ThemeData cho Dark Mode
      darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      // Quyết định hiển thị Theme nào dựa trên biến trạng thái
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: LabMenuScreen(isDarkMode: _isDarkMode, onThemeToggle: _toggleTheme),
    );
  }
}

// Màn hình Menu chính để chấm bài tiện lợi
class LabMenuScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const LabMenuScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4: Flutter UI Fundamentals'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildMenuButton(
              context,
              'Exercise 1: Core Widgets',
              const CoreWidgetsDemo(),
              Colors.blue,
            ),
            _buildMenuButton(
              context,
              'Exercise 2: Input Controls',
              const InputControlsDemo(),
              Colors.green,
            ),
            _buildMenuButton(
              context,
              'Exercise 3: Layout Basics',
              LayoutBasicsDemo(),
              Colors.orange,
            ),
            _buildMenuButton(
              context,
              'Exercise 4: App Structure & Theme',
              AppStructureDemo(
                isDarkMode: isDarkMode,
                onThemeToggle: onThemeToggle,
              ),
              // Dùng hàm ẩn danh để gọi lại và cập nhật giao diện
              Colors.purple,
            ),
            _buildMenuButton(
              context,
              'Exercise 5: Debug & Fix Errors',
              const DebugFixDemo(),
              Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String title,
    Widget targetScreen,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetScreen),
          );
        },
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
