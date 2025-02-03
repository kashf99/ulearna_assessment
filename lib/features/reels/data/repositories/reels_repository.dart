import 'dart:convert';

import 'package:ulearna_assessment/core/error/exceptions.dart';
import 'package:ulearna_assessment/core/network/api_service.dart';
import 'package:ulearna_assessment/features/reels/data/models/reel_model.dart';

abstract class ReelsRepository {
  Future<List<ReelModel>> fetchReelsData(int page);
}

class ReelsRepositoryImpl implements ReelsRepository {
  final ReelApiService apiService;

  ReelsRepositoryImpl({required this.apiService});

  @override
  Future<List<ReelModel>> fetchReelsData(int page) async {
    final response = await apiService.fetchReelsData(page);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = json.decode(response.body);
      if (decodedResponse['data'] != null &&
          decodedResponse['data']['data'] != null &&
          (decodedResponse['data']['data'] as List).isNotEmpty) {
        return List<ReelModel>.from(
          decodedResponse['data']['data'].map((x) => ReelModel.fromJson(x)),
        );
      } else {
        return [];
      }
    } else {
      throw ServerException();
    }
  }
}
