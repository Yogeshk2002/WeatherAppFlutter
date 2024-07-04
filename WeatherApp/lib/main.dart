import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(), // Provide the WeatherProvider to the entire app using Provider.
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        title: 'Weather App', // Title for the app.
        theme: ThemeData(
          primarySwatch: Colors.blue, 
        ),
        home: const HomeScreen(), // Set the HomeScreen as the initial screen of the app.
      ),
    );
  }
}
