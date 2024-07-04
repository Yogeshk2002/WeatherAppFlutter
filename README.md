# WeatherNow

This Flutter weather application is designed to provide users with accurate weather information in an intuitive and user-friendly way. It fetches data from weather API to display the weather details, This app is build using the Provider State management, ensuring a clean and maintainable codebase.


## Features

- Display the weather conditions including temperature,humidity,wind speed and more.
- User Friendly interface with intuitive design and smooth navigation.
- The home screen features a search bar where users can enter the name of a city.
- Fetching Weather Data
- Weather Details Screen
- Previously Searched Cities
- State Management
- Error Handling
- Responsive Design

## ScreenShots

<table>
  <tr>
    <td style="padding: 10px;"><img src="https://github.com/Yogeshk2002/WeatherAppFlutter/assets/110348902/73484e4d-12e3-4f3d-b8a6-19d4b800d82f" alt="Image 1" width="300"/></td>
    <td style="padding: 10px;"><img src="https://github.com/Yogeshk2002/WeatherAppFlutter/assets/110348902/0a9edae8-3aa4-4496-acf8-2260e169e1a3" alt="Image 2" width="300"/></td>
		<td style="padding: 10px;"><img src="https://github.com/Yogeshk2002/WeatherAppFlutter/assets/110348902/f5c339bd-3730-4075-8b67-6a34032b4b84" alt="Image 3" width="300"/></td>
		<td style="padding: 10px;"><img src="https://github.com/Yogeshk2002/WeatherAppFlutter/assets/110348902/37f76f35-856e-44ce-892d-9ee71daed9d3" alt="Image 4" width="300"/></td>
  </tr>
  <tr>
    <td style="padding: 10px;"><img src="https://github.com/Yogeshk2002/WeatherAppFlutter/assets/110348902/dd979439-aad2-45bc-bfcc-e45298c38a63" alt="Image 5" width="300"/></td>
    <td style="padding: 10px;"><img src="https://github.com/Yogeshk2002/WeatherAppFlutter/assets/110348902/3c5a7559-cf51-4748-8efa-de13c80c926e" alt="Image 6" width="300"/></td>
    <td style="padding: 10px;"><img src="https://github.com/Yogeshk2002/WeatherAppFlutter/assets/110348902/53e01162-f8c5-43cb-9bea-bcb1a4a1f593" alt="Image 7" width="300"/></td>
  </tr>
</table>


## Architecture

The app is built using the Model-View-ViewModel (MVVM) architecture, ensuring a clear separation of concerns between data, UI, and business logic. It leverages the Provider package for state management, facilitating efficient and reactive updates to the UI. The app's structure is organized into models, providers, views, and widgets, making it modular and easily maintainable. API interactions are handled by the WeatherProvider, which manages state and data fetching. The UI components observe changes in the ViewModel and update accordingly, providing a responsive and dynamic user experience.
## Getting Started

Follow these steps to get the app up and running

1. Clone the repository : `git clone https://github.com/Yogeshk2002/WeatherAppFlutter.git`
2. Navigate to the project directoy : `cd WeatherApp`
3. Install Dependencies : `flutter pub get`
4. Run the app : `flutter run`
## API Integration
The app integrates with a weather API to fetch weather data. The API key should be placed in the `lib/utils/constants.dart` file. You can obtain an API key by signing up on the This is the [openweathermap](https://home.openweathermap.org/users/sign_in)  weather service website.
## State Management
State management is handled using the Provider. The architecture separates the app into models,views, providing efficient way to manage application state and update the UI.
## Dependencies
- [Provider](https://pub.dev/packages/provider) - State Management
- [http](https://pub.dev/packages/http) - For making HTTP requests to the weather API

## Contributing

Contributing are welcome! If you find any issues or want to add new features, feel free to fork the repository and submit a pull request. Please follow the existing code style and structure.
