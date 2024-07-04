import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/weather_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextEditingController to capture user input from the TextField
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Access the WeatherProvider from the Provider package
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      // Prevent the bottom inset from causing layout issues
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "images/homeImage1.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 50),
                  // TextField for user to input city name
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxWidth * 0.9,
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue.withOpacity(0.5),
                            labelText: 'Enter city name',
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.location_city, color: Colors.white),
                          ),
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                        ),
                      );
                    },
                  ),
                  // Button to fetch weather data based on the city name input
                  ElevatedButton(
                    onPressed: () async {
                      // Call the fetchWeather method from the WeatherProvider
                      await weatherProvider.fetchWeather(_controller.text);
                      // If weather data is successfully fetched, navigate to the WeatherDetailsScreen
                      if (weatherProvider.weather != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WeatherDetailsScreen(),
                          ),
                        );
                      }
                    },
                    child: const Text('Get Weather'),
                  ),
                  // Show a loading indicator if the data is being fetched
                  if (weatherProvider.isLoading)
                    const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  // Display an error message if there's any
                  if (weatherProvider.errorMessage != null)
                    Text(
                      weatherProvider.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 30),
                  // Display an additional image at the bottom of the screen
                  SizedBox(
                    child: Image.asset("images/house.png"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






















// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:weather_app/providers/weather_provider.dart';
// import 'package:weather_app/screens/weather_details_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // TextEditingController to capture user input from the TextField
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // Access the WeatherProvider from the Provider package
//     final weatherProvider = Provider.of<WeatherProvider>(context);

//     return Scaffold(
//       // Prevent the bottom inset from causing layout issues
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               "images/homeImage1.png",
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 const SizedBox(height: 50),
//                 // TextField for user to input city name
//                 TextField(
//                   controller: _controller,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.blue.withOpacity(0.5),
//                     labelText: 'Enter city name',
//                     labelStyle: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                       borderSide: BorderSide.none,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                       borderSide: BorderSide.none,
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                       borderSide: const BorderSide(
//                         color: Colors.white,
//                         width: 2.0,
//                       ),
//                     ),
//                     prefixIcon: const Icon(Icons.location_city, color: Colors.white),
//                   ),
//                   style: const TextStyle(color: Colors.white),
//                   cursorColor: Colors.white,
//                 ),
//                 // Button to fetch weather data based on the city name input
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Call the fetchWeather method from the WeatherProvider
//                     await weatherProvider.fetchWeather(_controller.text);
//                     // If weather data is successfully fetched, navigate to the WeatherDetailsScreen
//                     if (weatherProvider.weather != null) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const WeatherDetailsScreen(),
//                         ),
//                       );
//                     }
//                   },
//                   child: const Text('Get Weather'),
//                 ),
//                 // Show a loading indicator if the data is being fetched
//                 if (weatherProvider.isLoading)
//                   const CircularProgressIndicator(
//                     color: Colors.white,
//                   ),
//                 // Display an error message if there's any
//                 if (weatherProvider.errorMessage != null)
//                   Text(
//                     weatherProvider.errorMessage!,
//                     style: const TextStyle(color: Colors.red),
//                   ),
//                 const SizedBox(height: 30),
//                 // Display an additional image at the bottom of the screen
//                 SizedBox(
//                   child: Image.asset("images/house.png"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

