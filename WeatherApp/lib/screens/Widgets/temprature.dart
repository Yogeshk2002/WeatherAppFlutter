import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class Temperature extends StatelessWidget {
  const Temperature({
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
        boxShadow: const[
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
            // Label for Temperature
            const Text(
              "Temperature",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            // Temperature icon and value
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Temperature icon image
                const Image(
                  image: AssetImage("images/thermomater.png"),
                  height: 50,
                  width: 50,
                ),
                const SizedBox(height: 5),
                // Temperature value row with icon and degree
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.beach_access_rounded,
                      color: Colors.black,
                      size: 17,
                    ),
                    Text(
                      '${weather?.temperature.toStringAsFixed(1)}°C',
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
