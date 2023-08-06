import 'package:flutter/material.dart';

class ForecastPage extends StatelessWidget {
  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Note: This is static data. Actual implementation of forecast data not implemented.',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ..._buildForecastItems(),
      ],
    );
  }

  List<Widget> _buildForecastItems() {
    return daysOfWeek.map((day) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 8.0,
        child: ListTile(
          leading: const Icon(
            Icons.wb_cloudy,
            size: 35,
          ),
          title: Text(
            day,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('Temperature: 20°C - 30°C\nWeather: Cloudy',
              style: TextStyle(fontSize: 18)),
        ),
      );
    }).toList();
  }
}
