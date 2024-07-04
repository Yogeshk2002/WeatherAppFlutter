import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class SearchedWindSpeed extends StatelessWidget {
  const SearchedWindSpeed({
    super.key,
    required this.weather,
  });

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 109, 179, 146),
            Color.fromRGBO(255, 255, 255, 0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Color.fromRGBO(255, 255, 255, 1),
              offset: Offset(2, 1))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Wind Speed",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.air,
                      color: Colors.black,
                      size: 17,
                    ),
                    Text(
                      "${weather?.windSpeed}m/s",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
