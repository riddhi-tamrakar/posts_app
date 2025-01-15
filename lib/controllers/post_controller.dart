import 'package:get/get.dart';
import 'package:my_app/models/post_model.dart';
import 'package:my_app/services/local_db_service.dart';
import 'package:my_app/services/api_service.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  final String localDbTableName = "posts";

  final LocalDbService _localDbService = LocalDbService();
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  // Initialize the database and fetch posts
  Future<void> initialize() async {
    try {
      await _localDbService.initializeDatabase(localDbTableName);
      await fetchPosts(); 
    } catch (e) {
      errorMessage.value = 'Initialization failed: $e';
    }
  }

  // Fetch posts from the API and update local storage
  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      final localPosts = await _localDbService.fetchLocalData(localDbTableName);
      if (localPosts.isNotEmpty) {
        posts.value = localPosts.map((map) => Post.fromJson(map)).toList();
         isLoading.value = false; // To hide the loader and display the posts from the local database. While this function continues and fetches the posts from the API and updates on the UI silently to provide a fast and smooth user experience. 
      }

      // Fetch posts from the API
      final fetchedPosts = await _apiService.fetchPostsFromApi();
      if (fetchedPosts != null) {
        posts.value = fetchedPosts;

        // Update the local database with new data
        List<Map<String, dynamic>> rawJson =
            fetchedPosts.map((Post e) => e.toJson()).toList();
        await _localDbService.updateDatabase(rawJson, localDbTableName);
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
