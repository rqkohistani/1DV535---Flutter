import 'package:flutter/material.dart';
import 'package:assignment_three/models/weather.dart';
import 'package:assignment_three/services/location_service.dart';
import 'package:assignment_three/services/weather_service.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({super.key});

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  late Future<Weather> _weather;
  String _updateTime = '';

  @override
  void initState() {
    super.initState();
    _updateWeather();
  }

  void _updateWeather() {
    setState(() {
      _weather = _getWeather();
      _updateTime = DateTime.now().toString();
    });
  }

  Future<Weather> _getWeather() async {
    LocationService locationService = LocationService();
    WeatherService weatherService = WeatherService();

    var location = await locationService.getCurrentLocation();
    return weatherService.getWeather(location);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: _weather,
        builder: (context, AsyncSnapshot<Weather> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            Weather? weather = snapshot.data;

            return Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'City: ${weather!.cityName}',
                    style: const TextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Updated at: $_updateTime',
                    style: const TextStyle(
                        fontSize: 16.0, fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                      height: 20.0), // provides a spacing of 20 pixels
                  Icon(
                    weather.weatherIcon,
                    size: 64.0,
                  ),
                  Text(
                    weather.weatherDescription.toUpperCase(),
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  const Text(
                    'Temperature:',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '${weather.temperatureF} °F',
                        style: const TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '${weather.temperatureC.toStringAsFixed(2)} °C',
                        style: const TextStyle(
                            fontSize: 60.0, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'Rain Volume: ${weather.rainVolume.toStringAsFixed(2)} mm',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: _updateWeather,
                    child: const Text('Update Weather'),
                  ),
                ],
              ),
            );
          } else {
            return const Text('Error loading weather data');
          }
        },
      ),
    );
  }
}
