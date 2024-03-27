import 'package:flutter/material.dart';
class ResponsiveScreen extends StatelessWidget {
Widget mobilescreen;
Widget tabletscreen;

ResponsiveScreen({required this.mobilescreen,required this.tabletscreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth<500) {
            return mobilescreen;
          }
          else{
            return tabletscreen;
          }
        },
      ),
    );
  }
}
