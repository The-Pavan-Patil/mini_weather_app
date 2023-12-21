import 'package:flutter/material.dart';
import 'package:mini_weather_app/services/weather_services.dart';

import 'Model/weather_model.dart';

class weatherPage extends StatefulWidget {
  const weatherPage({super.key});

  @override
  State<weatherPage> createState() => _weatherPageState();
}

class _weatherPageState extends State<weatherPage> {

  //api key
  final _weatherServices = WeatherServices('4f441fbccd1c59c49a5486a8876db715');
  Weather? _weather;

  //fetching
  _fetchWeather() async{
    //getCurrentCity
    String cityName = await _weatherServices.getCurrentCity();
    //getWeather for city
    try{
      final weather = await _weatherServices.getweather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    catch (e){
      print(e);
    }

  }

  //Animations
  //init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(_weather!.cityName ?? "Loading"),
            Text('${_weather?.temp.round()}c')
          ],
        ),
      ),
    );
  }
}
