import 'network.dart';
import 'location.dart';

const apiKey = '29fb98e39c1d2712ff308ce0f9a2d50e';
const url = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var cityUrl = '$url?q=$cityName&appid=$apiKey&units=metric';
    Network net = Network(cityUrl);
    var weatherData = await net.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location loc = new Location();
    await loc.getCurrentLocation();

    Network ntw = Network(
        '$url?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');

    var weatherData = await ntw.getData();

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
