import 'package:app_builder/api/PostsRepo.dart';
import 'package:app_builder/model/Post.dart';
import 'package:flutter/cupertino.dart';

class ParsePosts with ChangeNotifier {
  List<Post> posts;
  Future<List<Post>> getPosts(String url,String endPoint,int userId) async{
    try{
      posts =await PostsRepo.INSTANCE.getPostsFromApi(url,endPoint,userId);
    }catch(error){
     print(error);
    }
    return posts;
  }
}
