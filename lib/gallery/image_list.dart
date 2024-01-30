import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:images_grid/gallery/image_itemgrid.dart';
import 'package:images_grid/gallery/image_page.dart';
import 'package:images_grid/services/image_service.dart';
import 'package:images_grid/models/image_model.dart';

class ImageList extends StatefulWidget {
  final ImageService _imageService = ImageService();

  ImageList({super.key});

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  final ScrollController _scrollController = ScrollController();
  static const gridColumn = 3;
  var isLoading = false;
  var itemList = List<ImageItem>.empty(growable: true);

  @override
  void initState() {
    _scrollController.addListener(() {
      var scrollHeight = _scrollController.position.maxScrollExtent;
      var currentPixelPosition = _scrollController.position.pixels;
      if (scrollHeight == currentPixelPosition) {
        loadItems();
      }
    });
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    setState(() {
      isLoading = true;
    });
    try {
      var images = await widget._imageService.loadImages();
      itemList.addAll(images);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: itemList.length,
        shrinkWrap: true,
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: gridColumn,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImagePage(
                        image: itemList[index]
                            .optimalImagePath(context, gridColumn)),
                  ),
                );
              },
              child: ImageItemGrid(
                  key: ValueKey(itemList[index].optimalImagePath(context, 1)),
                  path: itemList[index].optimalImagePath(context, 1)));
        },
      ),
    );
  }
}
