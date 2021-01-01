import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio/coolors.dart';
import 'package:portfolio/sizedBox.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScrern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nameWidget = "Prashant\nSingh"
        .text
        .white
        .xl5
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
              child: VStack([
        ZStack([
          // PictureWidget(),
          Row(
            children: [
              VStack([
                if (context.isMobile) 50.heightBox else 10.heightBox,
                CustomeAppBar().shimmer(
                  primaryColor: Coolors.accentColor,
                ),
                30.heightBox,
                nameWidget,
                20.heightBox,
                VxBox()
                    .color(Coolors.accentColor)
                    .size(60, 10)
                    .make()
                    .shimmer(primaryColor: Coolors.accentColor),
                30.heightBox,
                SocialAccount(),
              ]).pSymmetric(
                h: context.percentWidth * 10,
                v: 32,
              ),
              Expanded(
                  child: VxResponsive(
                fallback: const Offstage(),
                medium: IntroductionWidget()
                    .pOnly(left: 120)
                    .h(context.percentHeight * 60),
                large: IntroductionWidget()
                    .pOnly(left: 120)
                    .h(context.percentHeight * 60),
              ))
            ],
          ).w(context.screenWidth)
        ]),
      ]))
          .size(context.screenWidth, context.percentHeight * 60)
          .color(Coolors.secondaryColor)
          .make(),
    );
  }
}

class IntroductionWidget extends StatefulWidget {
  @override
  _IntroductionWidgetState createState() => _IntroductionWidgetState();
}

class _IntroductionWidgetState extends State<IntroductionWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return VStack(
      [
        [
          "- Introduction".text.gray500.widest.sm.make(),
          10.heightBox,
          "Flutter Developer, firebase, dart & web."
              .text
              .white
              .xl3
              .maxLines(5)
              .make()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          10.heightBox,
        ].vStack(),
        RaisedButton(
          onPressed: () {
            launch("https://github.com/singhprashant1");
          },
          child: "Visit github.com".text.make(),
          color: Coolors.accentColor,
          shape: Vx.roundedSm,
          hoverColor: Vx.purple700,
        ),
        10.heightBox,
      ],
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Transform(
        alignment: Alignment.center,
        origin: Offset(context.percentWidth * 2, 0),
        transform: Matrix4.rotationY(pi),
        child: Image.asset(
          "ASSETS/profile.png",
          fit: BoxFit.cover,
          height: context.percentHeight * 60,
        ));
  }
}

class CustomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.codesquare,
      size: 50,
      color: Coolors.accentColor,
    );
  }
}

class SocialAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(AntDesign.twitter, color: Colors.white).mdClick(() {
        launch("https://twitter.com/singhprashant44");
      }).make(),
      20.widthBox,
      Icon(AntDesign.linkedin_square, color: Colors.white).mdClick(() {
        launch("https://www.linkedin.com/in/singhprashant99/");
      }).make(),
      20.widthBox,
      Icon(AntDesign.github, color: Colors.white).mdClick(() {
        launch("https://github.com/singhprashant1");
      }).make(),
      20.widthBox,
      Icon(AntDesign.instagram, color: Colors.white).mdClick(() {
        launch("https://www.instagram.com/singhprashant99/");
      }).make()
    ].hStack();
  }
}
