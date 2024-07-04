import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class Condition extends StatelessWidget {
  const Condition({
    super.key,
    required this.weather,
  });

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: 225,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Colors.white,
            Color.fromRGBO(255, 255, 255, 0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 2,
            color: Color.fromRGBO(255, 255, 255, 0.1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Display "Condition" label
            const Text(
              "Condition",
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container to display weather icon
                Container(
                  height: 53,
                  width: 53,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                  child: Image(
                    // Fetch weather icon from the network using URL from weather data
                    image: NetworkImage('http://openweathermap.org/img/wn/${weather?.icon}.png'),
                    height: 47,
                    width: 47,
                  ),
                ),
                // Display weather condition
                Text(
                  weather!.condition,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
