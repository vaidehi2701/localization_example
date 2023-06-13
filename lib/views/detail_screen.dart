//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homePage.dart';

class DetailScreen extends StatelessWidget {
  String country;

  String description;

  String img;

  String name;

  String num;

  DetailScreen(
      {Key? key,
      required this.img,
      required this.name,
      required this.description,
      required this.country,
      required this.num})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F5),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
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
                  child: Image.asset(
                    "assets/images/backer.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xffA5A5A5)),
                  ),
                ),
                Image.asset("assets/images/save.png", fit: BoxFit.cover),
              ],
            ),
          ),
          // todo first row complete

          const SizedBox(
            height: 150,
          ),
          Center(
              child: Hero(
                  tag: num,
                  child: Image.asset(
                    img,
                    height: 310,
                    width: 310,
                  ))),

          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 12, color: Color(0xffA5A5A5)),
            ),
          ),

          const SizedBox(
            height: 80,
          ),
          // todo last row complete
        ],
      ),
    );
  }
}
