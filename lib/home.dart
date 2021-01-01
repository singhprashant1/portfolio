import 'package:flutter/material.dart';
import 'package:portfolio/coolors.dart';
import 'package:portfolio/footer.dart';
import 'package:portfolio/header.dart';
import 'package:portfolio/middle.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolors.primaryColor,
      child: VStack([
        HeaderScrern(),
        if (context.isMobile) IntroductionWidget().p16(),
        MiddleScreen(),
        FooterScreen()
      ]).scrollVertical(),
    );
  }
}
