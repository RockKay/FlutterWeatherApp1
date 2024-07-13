import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = 'ff91d0bf5f9a43498ea213154240407';
  static const String apiUrl = 'http://api.weatherapi.com/v1/current.json';

  static Future<Map<String, dynamic>> getWeather(String city) async {
    String url = '$apiUrl?key=$apiKey&q=$city&aqi=no';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

void main() {
  fetchWeatherForCities();
}

void fetchWeatherForCities() async {
  List<String> cities = [
    'Hà Giang',
    'Cao Bằng',
    'Lạng Sơn',
    'Bắc Kạn',
    'Tuyên Quang',
    'Thái Nguyên',
    'Lào Cai',
    'Yên Bái',
    'Sơn La',
    'Phú Thọ',
    'Vĩnh Phúc',
    'Quảng Ninh',
    'Bắc Giang',
    'Bắc Ninh',
    'Hà Nam',
    'Hà Nội',
    'Hà Tây',
    'Hải Dương',
    'Hải Phòng',
    'Hưng Yên',
    'Nam Định',
    'Ninh Bình',
    'Thái Bình',
    'Vĩnh Phúc',
    'Hòa Bình',
    'Hà Tĩnh',
    'Nghệ An',
    'Quảng Bình',
    'Quảng Trị',
    'Thanh Hóa',
    'Thừa Thiên Huế',
    'Đà Nẵng',
    'Quảng Nam',
    'Quảng Ngãi',
    'Bình Định',
    'Phú Yên',
    'Khánh Hòa',
    'Ninh Thuận',
    'Bình Thuận',
    'Kon Tum',
    'Gia Lai',
    'Đắk Lắk',
    'Đắk Nông',
    'Lâm Đồng',
    'Bình Phước',
    'Tây Ninh',
    'Bình Dương',
    'Đồng Nai',
    'Bà Rịa - Vũng Tàu',
    'TP Hồ Chí Minh',
    'Long An',
    'Tiền Giang',
    'Bến Tre',
    'Trà Vinh',
    'Vĩnh Long',
    'Đồng Tháp',
    'An Giang',
    'Kiên Giang',
    'Cần Thơ',
    'Hậu Giang',
    'Sóc Trăng',
    'Bạc Liêu',
    'Cà Mau'
  ];

  for (var city in cities) {
    try {
      var weatherData = await ApiService.getWeather(city);
      // Xử lý dữ liệu thời tiết ở đây
      print('Thông tin thời tiết cho $city: $weatherData');
    } catch (e) {
      print('Lỗi khi gọi API thời tiết cho $city: $e');
    }
  }
}
