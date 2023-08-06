import 'package:assignment_three/models/location.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Location> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return Location(lat: position.latitude, lon: position.longitude);
  }
}
