import 'package:flutter/material.dart';

IconData getWeatherIcon(String weatherDescription) {
  weatherDescription = weatherDescription.toLowerCase();
  switch (weatherDescription) {
    case 'clear':
      return Icons.wb_sunny;
    case 'clouds':
      return Icons.wb_cloudy;
    case 'rain':
      return Icons.umbrella;
    case 'snow':
      return Icons.ac_unit;
    case 'thunderstorm':
      return Icons.flash_on;
    case 'drizzle':
      return Icons.grain;
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
    case 'sand':
    case 'ash':
    case 'squall':
    case 'tornado':
      return Icons.blur_on;
    default:
      return Icons.error;
  }
}
