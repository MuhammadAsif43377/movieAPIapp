import 'package:flutter/material.dart';
class ResponsiveScreen extends StatelessWidget {
 Widget mobileScreen;
 Widget tabletScreen;
 ResponsiveScreen({required this.mobileScreen,required this.tabletScreen});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth<550)
            {
              return mobileScreen;
            }
          else
            {
              return tabletScreen;
            }
        },
      )
    );
  }
}
