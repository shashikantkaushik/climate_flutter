import 'package:geolocator/geolocator.dart';

class Location{
  double longitude;
  double latitude;
Future<void> getCurrentLocation() async{
  try {
    LocationPermission permission = await Geolocator.checkPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude=position.latitude;
    longitude=position.longitude;

  }
  catch (e) {
    print(e);
  }
}
}