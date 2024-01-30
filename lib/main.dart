import 'package:flutter/material.dart';
import 'package:images_grid/gallery/image_page.dart';
import 'package:images_grid/gallery/image_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gallery',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => ImageList(),
          '/image': (context) => ImagePage(image: ''),
        }
    );
  }
}
