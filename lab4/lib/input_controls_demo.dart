import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _sliderValue = 50.0;
  bool _switchValue = false;
  int _radioValue = 1;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2: Input Controls'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Slider
              const Text('Slider:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 10,
                label: _sliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
              Text('Current Slider Value: ${_sliderValue.toStringAsFixed(1)}'),
              const Divider(height: 30),

              // 2. Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Switch:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Switch(
                    value: _switchValue,
                    onChanged: (bool value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),
              Text('Switch is ${_switchValue ? "ON" : "OFF"}'),
              const Divider(height: 30),

              // 3. RadioListTile
              const Text('Radio Group:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              RadioListTile<int>(
                title: const Text('Option 1'),
                value: 1,
                groupValue: _radioValue,
                onChanged: (int? value) {
                  setState(() {
                    _radioValue = value!;
                  });
                },
              ),
              RadioListTile<int>(
                title: const Text('Option 2'),
                value: 2,
                groupValue: _radioValue,
                onChanged: (int? value) {
                  setState(() {
                    _radioValue = value!;
                  });
                },
              ),
              Text('Selected Radio Value: $_radioValue'),
              const Divider(height: 30),

              // 4. DatePicker
              const Text('Date Picker:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                icon: const Icon(Icons.calendar_today),
                label: const Text('Pick a Date'),
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Selected Date: ${_selectedDate == null ? "None" : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
