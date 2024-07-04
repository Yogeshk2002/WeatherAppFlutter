import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherService {
  // Method to fetch weather data for a given city
  Future<Weather> getWeather(String city) async {
    // Construct the URL with the city name and API key
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

    // Send a GET request to the API
    final response = await http.get(Uri.parse(url));

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Parse the JSON response and convert it to a Weather object
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      // If the request failed, throw an exception with an error message
      throw Exception('Failed to load weather');
    }
  }
}
