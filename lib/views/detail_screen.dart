import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visnu_god/utils/localization.dart';
import 'homePage.dart';

class DetailScreen extends StatefulWidget {
  final String description;
  final String img;
  final String name;
  final String heroTag;

  const DetailScreen({
    Key? key,
    required this.img,
    required this.name,
    required this.description,
    required this.heroTag,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
      backgroundColor: Colors.black,
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
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: Text(
                    AppLocalization.of(context)
                        .getTranslatedValue(widget.name)
                        .toString(),
                    style:
                        const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Image.asset(
                  "assets/images/save.png",
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: Hero(
              tag: widget.heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  widget.img,
                  height: 310,
                  width: 310,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Text(
              AppLocalization.of(context)
                  .getTranslatedValue(widget.description)
                  .toString(),
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xffA5A5A5),
              ),
            ),
          ),
          // todo: Add the remaining widgets of the last row
        ],
      ),
    );
  }
}
