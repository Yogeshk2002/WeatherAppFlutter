

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/Widgets/SearchedCities/searched_humidity.dart';
import 'package:weather_app/screens/Widgets/SearchedCities/searched_temprature.dart';
import 'package:weather_app/screens/Widgets/SearchedCities/searched_wind_speed.dart';
import 'package:weather_app/screens/Widgets/WindSpeed.dart';
import 'package:weather_app/screens/Widgets/temprature.dart';
import 'package:weather_app/screens/widgets/condition.dart';
import 'package:weather_app/screens/widgets/humidity.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the WeatherProvider from the Provider package
    final weatherProvider = Provider.of<WeatherProvider>(context);
    // Get the current weather data from the provider
    final weather = weatherProvider.weather;
    // Get the list of previously searched cities from the provider
    final previouslySearchedCities = weatherProvider.previouslySearchedCities;
    // Get screen size for responsiveness
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(40, 47, 90, 1),
        leading: GestureDetector(
          onTap: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () async {
              // Refresh the weather data for the last searched city
              if (weatherProvider.lastSearchedCity != null) {
                await weatherProvider.fetchWeather(weatherProvider.lastSearchedCity!);
              }
            },
          ),
        ],
      ),
      body: weather != null
          ? Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "images/homeImage1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height * 0.1),
                      Container(
                        height: screenSize.height * 0.6,
                        width: screenSize.width * 0.9,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const[
                             BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 2,
                              color: Color.fromRGBO(255, 255, 255, 0.1),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Display the city name
                              Text(
                                weather.cityName,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Row to display wind speed, temperature, and humidity
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  WindSpeed(weather: weather),
                                  Temperature(weather: weather),
                                  Humidity(weather: weather),
                                ],
                              ),
                              const SizedBox(height: 20),
                              // Display the weather condition
                              Condition(weather: weather),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const Text(
                        "Previously Searched Cities",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      const Divider(),
                      // List of previously searched cities
                      Expanded(
                        child: ListView.builder(
                          itemCount: previouslySearchedCities.length,
                          itemBuilder: (context, index) {
                            final city = previouslySearchedCities[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 250,
                              width: 400,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 0.1),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const[
                                   BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    color: Color.fromRGBO(255, 255, 255, 0.1),
                                  )
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        // Display the previously searched city name
                                        Text(
                                          city.cityName,
                                          style: const TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        // Row to display wind speed, temperature, and humidity for the previously searched city
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SearchedWindSpeed(weather: city),
                                            SearchedTempreature(weather: city),
                                            SearchedHumidity(weather: city),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Delete button to remove a previously searched city
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.delete, color: Colors.red),
                                        onPressed: () {
                                          weatherProvider.removeCity(city.cityName);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "images/homeImage1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const Center(
                  child: Text("No Data Available"),
                ),
              ],
            ),
    );
  }
}

