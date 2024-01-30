import 'dart:core';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:images_grid/models/image_model.dart';

class ImageService {
  final _url = 'https://ru.api.dev.photograf.io/v1/jobEvaluation/images';
  String _nextToken = '';

  Future<List<ImageItem>> loadImages() async {
    var urlPath =
        _nextToken.isEmpty ? _url : '$_url?continuationToken=$_nextToken';
    var response = await http.get(Uri.parse(urlPath));
    var jsonData = jsonDecode(response.body);
    _nextToken = jsonData['continuationToken'] ?? '';
    List images = jsonData['result']['items'];
    return images.map((data) => ImageItem.fromJson(data)).toList();
  }

}
