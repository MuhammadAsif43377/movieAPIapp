import 'package:flutter/material.dart';
class TabletScreen extends StatefulWidget {
  const TabletScreen({super.key});

  @override
  State<TabletScreen> createState() => _TabletScreenState();
}

class _TabletScreenState extends State<TabletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ), itemBuilder: (context, index) {
        return Container(color: Colors.purple,);
      },),
    );
  }
}
