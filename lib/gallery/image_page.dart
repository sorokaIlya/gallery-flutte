import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final String image;
  const ImagePage({Key? key, required this.image}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: Image(
                image: NetworkImage(image),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.all(20.0),
            child: Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text('Back'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
