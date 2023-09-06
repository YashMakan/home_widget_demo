import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:home_widget_demo/models/weather.dart';

class HomeWidget extends StatelessWidget {
  final Weather weather;

  const HomeWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: WeatherUtil.getColor(weather.weatherType),
        ),
      ),
      child: Column(
        children: [
          Image.network(weather.image),
          Text(weather.weather,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              textScaleFactor: 1.7),
          Text(weather.cityName, style: const TextStyle(color: Colors.white60, fontSize: 14)),
        ],
      ),
    );
  }
}
