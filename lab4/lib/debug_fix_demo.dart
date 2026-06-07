import 'package:flutter/material.dart';

class DebugFixDemo extends StatefulWidget {
  const DebugFixDemo({super.key});

  @override
  State<DebugFixDemo> createState() => _DebugFixDemoState();
}

class _DebugFixDemoState extends State<DebugFixDemo> {
  int _clickCount = 0;
  DateTime? _fixedDate;

  @override
  Widget build(BuildContext context) {
    // FIX 2: Bọc toàn bộ body bằng SingleChildScrollView để chống lỗi Overflow trên màn hình nhỏ/bàn phím xuất hiện
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5: Debug & Fix UI'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fix 1: ListView inside Column',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),

              // FIX 1: Dùng Container có chiều cao cố định (hoặc Expanded nếu không có SingleChildScrollView)
              // để tránh lỗi "Vertical viewport was given unbounded height"
              Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent),
                ),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      ListTile(title: Text('Fixed Item ${index + 1}')),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Fix 3: State Update (setState)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Clicks: $_clickCount'),
                  ElevatedButton(
                    onPressed: () {
                      // FIX 3: Phải bọc hành động trong setState() thì UI mới render lại giá trị mới
                      setState(() {
                        _clickCount++;
                      });
                    },
                    child: const Text('Click Me'),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                'Fix 4: DatePicker Context Error',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),

              // FIX 4: Gọi showDatePicker sử dụng 'context' hợp lệ từ hàm build của Widget Tree hiện tại
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context:
                        context, // Sử dụng BuildContext trực tiếp từ widget tree hợp lệ
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2025),
                  );
                  if (picked != null) {
                    setState(() {
                      _fixedDate = picked;
                    });
                  }
                },
                child: Text(
                  _fixedDate == null ? 'Open Date Picker' : 'Date: $_fixedDate',
                ),
              ),

              // Thêm khoảng trống giả lập để kiểm tra tính năng cuộn chống tràn màn hình (Fix 2)
              const SizedBox(height: 300),
              const Text(
                'End of screen - SingleChildScrollView works perfectly!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
