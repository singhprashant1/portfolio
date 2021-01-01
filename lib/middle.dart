import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatefulWidget {
  @override
  _MiddleScreenState createState() => _MiddleScreenState();
}

class _MiddleScreenState extends State<MiddleScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.purple700,
      child: Flex(
        direction: context.isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          "All Creative Work,\n"
              .richText
              .withTextSpanChildren(
                  ["Selected projects.".textSpan.yellow400.make()])
              .xl4
              .white
              .make(),
          20.widthBox,
          Expanded(
              child: VxSwiper(
            items: [
              GestureDetector(
                  onTap: () {
                    launch("https://github.com/singhprashant1/speechtotext");
                  },
                  child: ProjectWidget(title: "Speech to Text")),
              GestureDetector(
                  onTap: () {
                    launch("https://github.com/singhprashant1/covid-19");
                  },
                  child: ProjectWidget(title: "Covid-19")),
              GestureDetector(
                  onTap: () {
                    launch("https://github.com/singhprashant1/pdf-to-speech");
                  },
                  child: ProjectWidget(title: "pdf to speech")),
              GestureDetector(
                  onTap: () {
                    launch("https://github.com/singhprashant1/weather");
                  },
                  child: ProjectWidget(title: "Weather")),
              GestureDetector(
                  onTap: () {
                    launch(
                        "https://github.com/singhprashant1/whatsapp-clone-UI");
                  },
                  child: ProjectWidget(title: "WhatsApp UI")),
            ],
            height: 170,
            viewportFraction: context.isMobile ? 0.75 : 0.4,
            autoPlay: true,
            autoPlayAnimationDuration: 1.seconds,
          ))
        ],
      ).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String title;

  const ProjectWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return title.text.bold.white.xl.wide.center
        .make()
        .box
        .p8
        .roundedLg
        .alignCenter
        .square(200)
        .neumorphic(color: Vx.purple700, elevation: 5.0, curve: VxCurve.flat)
        .make()
        .p16();
  }
}
