import 'package:flutter/material.dart';


import 'movie_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,

      // 2. GỌI MÀN HÌNH ĐÓ RA ĐỂ CHẠY CHÍNH
      home: const MovieListScreen(),
    );
  }
}
