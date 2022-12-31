import 'package:http/http.dart' as http;

class PlaceService {
  Future<String?> getUrl(Uri uri, {Map<String, String>? headers}) async {
    try {
      var response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }
}
