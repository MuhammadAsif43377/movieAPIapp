import 'package:flutter/material.dart';
class tabletScreen extends StatefulWidget {
  const tabletScreen({super.key});

  @override
  State<tabletScreen> createState() => _tabletScreenState();
}

class _tabletScreenState extends State<tabletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 500,
        width: double.infinity,
        color: Colors.blue,
      ),
    );
  }
}
