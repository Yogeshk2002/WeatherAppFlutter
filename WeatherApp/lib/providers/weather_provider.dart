import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  String? _errorMessage;
  String? _lastSearchedCity;
  final List<Weather> _previouslySearchedCities = [];

  // Getters to access private variables
  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get lastSearchedCity => _lastSearchedCity;
  List<Weather> get previouslySearchedCities => _previouslySearchedCities;

  // Method to fetch weather data from the OpenWeather API
  Future<void> fetchWeather(String cityName) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notify listeners to update the UI

    
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    try {
      // Send HTTP GET request to the API
      final response = await http.get(Uri.parse(url));

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the response body
        final data = json.decode(response.body);
        // Create a Weather object from the parsed data
        _weather = Weather.fromJson(data);
        _lastSearchedCity = cityName;
        // Add the fetched weather to the list of previously searched cities
        _previouslySearchedCities.add(_weather!);
      } else {
        // Error message if the response status code is not 200
        _errorMessage = 'Failed to load weather data';
      }
    } catch (e) {
      // Catch any exceptions and set the error message
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners to update the UI
    }
  }

  // Method to remove a city from the previously searched cities list
  void removeCity(String cityName) {
    // Remove the city from the list based on case-insensitive comparison
    _previouslySearchedCities.removeWhere((city) => city.cityName.toLowerCase() == cityName.toLowerCase());
    notifyListeners(); // Notify listeners to update the UI
  }
}


