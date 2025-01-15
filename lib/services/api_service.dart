import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/models/post_model.dart';

class ApiService {
  static const String _apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>?> fetchPostsFromApi() async {
    try {
      final response = await http.get(Uri.parse(_apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((post) => Post.fromJson(post)).toList();
      } else {
        throw Exception('Failed to fetch posts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching posts: $e');
      return null;
    }
  }
}
