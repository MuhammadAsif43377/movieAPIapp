import 'package:flutter/material.dart';
import 'package:friday/movie_description.dart';
import 'mobile_layout.dart';
import 'mobilelayoutpractice.dart';
void main()
{
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LayoutPractice(),
      debugShowCheckedModeBanner: false,
    );
  }
}
