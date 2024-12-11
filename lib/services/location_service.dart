import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

/// Mengambil alamat saat ini berdasarkan koordinat GPS
Future<String> getCurrentAddress() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return 'Layanan lokasi tidak aktif.';
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return 'Izin lokasi ditolak.';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return 'Izin lokasi ditolak secara permanen.';
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      return '${place.street}, ${place.locality}, ${place.country}';
    }

    return 'Alamat tidak ditemukan';
  } catch (e) {
    return 'Gagal mendapatkan lokasi: $e';
  }
}
