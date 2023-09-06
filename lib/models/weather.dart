import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

class Weather {
  final WeatherType weatherType;
  final String weather;
  final String cityName;
  final String desc;
  final String image;

  Weather(
      {required this.weatherType,
      required this.weather,
      required this.desc,
      required this.image,
      required this.cityName});
}
