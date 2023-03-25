import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
const openWeatherMapURL='https://api.openweathermap.org/data/2.5/weather';
const apikey='8c78b24a42c3f328c491c33f293bb634';
class WeatherModel {
  Future<dynamic>getCityWeather(String cityName) async{
    var url='$openWeatherMapURL?q=$cityName&appid=$apikey&units=metric';
    NetworkHelper networkhelper=NetworkHelper(url);
    var weatherData =networkhelper.getData();

    return weatherData;
  }
  Future <dynamic> getLocationWeather() async{
  Location location = Location();
  await location.getCurrentLocation();


  NetworkHelper networkHelper=NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

  var weatherData =await networkHelper.getData();
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
