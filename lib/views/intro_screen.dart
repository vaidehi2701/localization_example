import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:visnu_god/data/widgets.dart';
import 'package:visnu_god/views/homePage.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F5),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: PageView(
          controller: controller,
          children: [
            Container(
                child: Stack(
              children: [
                Positioned(
                    top: 50,
                    left: 28,
                    child: MainText(name: "Explore", size: 38)),
                Positioned(
                    right: 0,
                    top: 170,
                    child: Image.asset("assets/images/main.png")),
              ],
            )),
            Container(
                child: Stack(
              children: [
                Positioned(
                    top: 50,
                    right: 28,
                    child: MainText(name: "SuperHero", size: 38)),
                Positioned(
                    left: 0,
                    top: 170,
                    child: Image.asset("assets/images/slide.png")),
              ],
            )),
          ],
        ),
      ),
      bottomSheet: Container(
        color: const Color(0xffF2F3F5),
        height: 78,
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                child: const Text("Skip")),
            SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.black,
                    dotHeight: 10,
                    dotWidth: 10))
          ],
        ),
      ),
    );
  }
}
