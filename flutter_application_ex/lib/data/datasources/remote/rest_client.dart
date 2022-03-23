import 'package:dio/dio.dart';
import 'package:flutter_application_ex/data/models/post.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://my-json-server.typicode.com/truelightn/ex_flutter")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/posts')
  Future<List<Post>> getPosts();
}
