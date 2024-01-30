import 'package:flutter/cupertino.dart';

class ImageVariant {
  final int width;
  final int height;
  final String url;

  ImageVariant(this.width, this.height, this.url);

  factory ImageVariant.fromJson(dynamic json) {
    return ImageVariant(
      json['width'],
      json['height'],
      json['url'],
    );
  }

  double get aspectRation => width / height;
}

class ImageItem {
  final String id;
  final List<ImageVariant> variants;

  const ImageItem({required this.id, required this.variants});

  factory ImageItem.fromJson(dynamic json) {
    return ImageItem(
        id: json['id'],
        variants: List<ImageVariant>.from(json['variants'].map((model)=> ImageVariant.fromJson(model)))
    );
  }

  String optimalImagePath(BuildContext context, int column) {
   double sizeScreen = (MediaQuery.of(context).size.width / column) / (MediaQuery.of(context).size.height / column);
   var variantIndex = variants.indexWhere((element) => element.aspectRation >= sizeScreen);
   if(variantIndex > -1) {
     return variants[variantIndex].url;
   }
   return variants.reduce((curr, next) => curr.aspectRation > next.aspectRation ? curr: next).url;
  }
}
