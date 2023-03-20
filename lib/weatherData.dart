// ignore_for_file: file_names, unused_import


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:Havadurumu/weatherModel.dart';

class WeatherData {
  Future<WeatherVeri> getData(var latitude, var longitude) async { 
    var uriCall = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=b6ff7cfeb7464f9fab410100232003&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return WeatherVeri.fromJson(body); 
  }
} 
