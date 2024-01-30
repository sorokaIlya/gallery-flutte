import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageItemGrid extends StatelessWidget {
  final String path;

  const ImageItemGrid({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
        width: 1.0,
      )),
      child: CachedNetworkImage(
        memCacheHeight: 200,
        memCacheWidth: 200,
        fit: BoxFit.cover,
        imageUrl: path,
        placeholder: (BuildContext context, String url) =>
            const CircularProgressIndicator(),
        errorWidget: (BuildContext context, String url, dynamic error) =>
            const Icon(Icons.error),
      ),
    );
    ;
  }
}
