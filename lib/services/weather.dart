import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:geolocator/geolocator.dart';

const String apiKeys = 'API-KEYS HERE';
const String openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(dynamic cityName) async {
    var url = '$openWeatherURL?q=$cityName&appid=$apiKeys&units=imperial';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    await Geolocator.requestPermission();
    // Uri url = Uri.parse();

    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKeys&units=imperial');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition <= 400) {
      return '🌧';
    } else if (condition <= 600) {
      return '☔️';
    } else if (condition <= 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition >= 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 77) {
      return 'It\'s 🍦 time';
    } else if (temp > 65) {
      return 'Time for shorts and 👕';
    } else if (temp < 35) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
