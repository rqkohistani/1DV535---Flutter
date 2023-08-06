import 'package:assignment_three/models/location.dart';
import 'package:assignment_three/models/weather.dart';
import 'package:assignment_three/utils/weather_icon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class WeatherService {
  final String apiKey = '0d2e1f25e0b4c953d951acc2757f0bb8';

  Future<Weather> getWeather(Location location) async {
    String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.lon}&appid=$apiKey&units=imperial';

    http.Response response = await http.get(Uri.parse(apiUrl));

    Map weatherData = json.decode(response.body);

    if (weatherData.containsKey('rain')) {
      double rainVolume = weatherData['rain']['1h'] ?? 0.0;
      weatherData['rainVolume'] = rainVolume;
    } else {
      weatherData['rainVolume'] = 0.0;
    }

    double temperatureF = weatherData['main']['temp'].toDouble() ?? 0.0;
    double temperatureC = (temperatureF - 32) * 5 / 9; // convert F to C
    IconData weatherIcon = getWeatherIcon(weatherData['weather'][0]['main']);

    return Weather(
      cityName: weatherData['name'] ?? 'Unknown',
      weatherDescription:
          weatherData['weather'][0]['description'] ?? 'Unknown weather',
      weatherIcon: weatherIcon,
      temperatureF: temperatureF,
      temperatureC: temperatureC,
      rainVolume: weatherData['rainVolume'],
    );
  }
}
