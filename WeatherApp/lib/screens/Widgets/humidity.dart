import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class Humidity extends StatelessWidget {
  const Humidity({
    super.key,
    required this.weather,
  });

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 98,
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
        boxShadow:const  [
           BoxShadow(
            blurRadius: 2,
            spreadRadius: 2,
            color: Color.fromRGBO(255, 255, 255, 0.1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Label for Humidity
            const Text(
              "Humidity",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            // Humidity icon and value
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Humidity icon image
                const Image(
                  image: AssetImage("images/humidity.png"),
                  height: 50,
                  width: 50,
                ),
                const SizedBox(height: 5),
                // Humidity value row with icon and percentage
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.water_drop,
                      color: Colors.black,
                      size: 17,
                    ),
                    Text(
                      '${weather?.humidity}%',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
