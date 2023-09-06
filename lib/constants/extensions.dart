import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

extension WeatherTypeExtension on WeatherUtil {
  WeatherType fromCode(int? code) {
    switch (code) {
      case 200:
      case 201:
      case 202:
      case 210:
      case 211:
      case 212:
      case 221:
      case 230:
      case 231:
      case 232:
        return WeatherType.thunder;

      case 300:
      case 301:
      case 302:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 321:
        return WeatherType.lightRainy;

      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
      case 511:
      case 520:
      case 521:
      case 522:
      case 531:
        return WeatherType.heavyRainy;

      case 600:
      case 601:
      case 602:
      case 611:
      case 612:
      case 613:
      case 615:
      case 616:
      case 620:
      case 621:
      case 622:
        return WeatherType.heavySnow;

      case 701:
      case 711:
      case 721:
      case 731:
      case 741:
      case 751:
      case 761:
      case 762:
      case 771:
      case 781:
        return WeatherType.hazy;

      case 800:
        return WeatherType.sunny;

      case 801:
      case 802:
      case 803:
      case 804:
        return WeatherType.cloudy;

      default:
        return WeatherType.sunny;
    }
  }
}