import 'package:http/http.dart' as http;

class ReelApiService {
  static const String baseUrl = 'https://api.ulearna.com/bytes/all';

  Future<http.Response> fetchReelsData(int page) async {
    final Uri url = Uri.parse('$baseUrl?page=$page&limit=10&country=United+States');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Failed to load data, Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}
