import 'package:home_widget_demo/models/location.dart';
import 'package:home_widget_demo/models/weather.dart' as wt;
import 'package:home_widget_demo/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:home_widget_demo/constants/strings.dart';
import 'package:home_widget_demo/home_widget_config.dart';
import 'package:home_widget_demo/views/home_widget/home_widget.dart';
import 'package:weather/weather.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  WeatherFactory wf = WeatherFactory(key);
  Location loc = Location.pickLocation();
  wt.Weather? currentWeather;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HomeWidgetConfig.initialize().then((value) async {
        callApiAndUpdateUI();
      });
    });
    super.initState();
  }

  callApiAndUpdateUI() {
    loc = Location.pickLocation();
    wf.currentWeatherByLocation(loc.lat, loc.long).then((w) {
      currentWeather = wt.Weather(
          weatherType: WeatherUtil().fromCode(w.weatherConditionCode),
          weather: "${w.temperature?.celsius?.toStringAsFixed(2) ?? "--"}°",
          desc: w.weatherDescription ?? "--",
          image:
          "https://openweathermap.org/img/wn/${w.weatherIcon}@2x.png",
          cityName: w.areaName ?? "--");
      HomeWidgetConfig.update(
          context, HomeWidget(weather: currentWeather!));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          callApiAndUpdateUI();
        },
        elevation: 0,
        backgroundColor: Colors.blueAccent.withOpacity(0.3),
        child: const Icon(Icons.refresh),
      ),
      body: Stack(
        children: [
          if (currentWeather?.weatherType != null)
            WeatherBg(
              weatherType: currentWeather!.weatherType,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            )
          else
            const Center(
              child: CircularProgressIndicator(),
            ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: screenHeight / 15,
                ),
                Text(
                  currentWeather?.desc ?? '--',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth / 14,
                      shadows: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            spreadRadius: .1,
                            blurRadius: 16)
                      ]),
                ),
                Text(
                  currentWeather?.cityName ?? '--',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth / 20,
                      shadows: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: .1,
                            blurRadius: 16)
                      ]),
                ),
                Text(
                  currentWeather?.weather ?? '--',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth / 5,
                      shadows: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: .1,
                            blurRadius: 16)
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
