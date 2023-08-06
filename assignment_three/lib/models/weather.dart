import 'package:flutter/material.dart';

class Weather {
  final String cityName;
  final String weatherDescription;
  final IconData weatherIcon;
  final double temperatureF;
  final double temperatureC;
  final double rainVolume;

  Weather({
    required this.cityName,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.temperatureF,
    required this.temperatureC,
    required this.rainVolume,
  });
}
