import 'package:dio/dio.dart';
import 'package:flutter_application_ex/data/datasources/remote/rest_client.dart';
import 'package:flutter_application_ex/data/models/post.dart';

class RankingRepositories {
  final RestClient _restClient;

  // const RankingRepositories(this._restClient);

  RankingRepositories.create() : _restClient = RestClient(Dio());

  Future<Post> getRankings() async {
    try {
      final result = await _restClient.getPosts();
      return result;
    } on DioError {
      rethrow;
    }
  }
}
