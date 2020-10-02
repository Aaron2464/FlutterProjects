import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const openWeatherMapURL = 'https://samples.openweathermap.org/data/2.5/weather';
const apiKey = 'b6907d289e10d714a6e88b30761fae22';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey';
    print(url);
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var url =
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    print(url);
    // &units=metric
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
