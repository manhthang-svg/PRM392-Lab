import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1: Core Widgets'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Headline Text
            const Text(
              'Welcome to Flutter UI!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),

            // 2. Material Icon
            const Icon(Icons.star, color: Colors.amber, size: 50),
            const SizedBox(height: 20),

            // 3. Image.network
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://picsum.photos/300/150', // Lấy ảnh ngẫu nhiên từ Picsum
                height: 150,
                width: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Không thể tải ảnh. Vui lòng kiểm tra internet!',
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // 4. Card containing a ListTile
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text('Phùng Mạnh Thắng'),
                subtitle: Text('IT Student @ FPT University'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
