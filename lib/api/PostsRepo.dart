import 'package:app_builder/model/Post.dart';
import 'package:dio/dio.dart';

class PostsRepo {
  static PostsRepo INSTANCE = PostsRepo._private();
  PostsRepo._private();
  final Dio dio = Dio();

  Future<List<Post>> getPostsFromApi(String url,String endPoint,int userId) async {
    // print("here");

    if (userId != null) {
      return dio.get("$url/$endPoint",
          queryParameters: {"userId": userId}).then((response) {
        // print(response.data['data'].toString());
        List<Post> list =
            (response.data as List).map((post) => Post.fromJson(post)).toList();
        // print(list.toString());
        return list;
      });
    } else {
      return dio
          .get("$url/$endPoint")
          .then((response) {
        // print(response.data['data'].toString());
        List<Post> list =
            (response.data as List).map((post) => Post.fromJson(post)).toList();
        // print(list.toString());
        return list;
      });
    }
  }
}
