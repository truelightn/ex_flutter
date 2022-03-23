import 'package:dio/dio.dart';
import 'package:flutter_application_ex/data/datasources/remote/rest_client.dart';
import 'package:flutter_application_ex/data/models/post.dart';

class PostRepositories {
  final RestClient _restClient;

  // const RankingRepositories(this._restClient);

  PostRepositories.create() : _restClient = RestClient(Dio());

  Future<List<Post>> getPosts() async {
    try {
      final result = await _restClient.getPosts();
      return result;
    } on DioError {
      rethrow;
    }
  }
}
