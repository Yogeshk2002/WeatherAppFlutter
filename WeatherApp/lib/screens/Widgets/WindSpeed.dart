import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WindSpeed extends StatelessWidget {
  const WindSpeed({
    super.key,
    required this.weather,
  });

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 100,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Label for Wind Speed
            const Text(
              "Wind Speed",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            // Wind speed icon and value
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Wind speed icon image
                const Image(
                  image: AssetImage("images/anemometer.png"),
                  height: 50,
                  width: 50,
                ),
                const SizedBox(height: 5),
                // Wind speed value row with icon and speed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.air,
                      color: Colors.black,
                      size: 17,
                    ),
                    Text(
                      "${weather?.windSpeed} m/s",
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
