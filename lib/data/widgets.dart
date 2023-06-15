import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visnu_god/utils/localization.dart';
import 'package:visnu_god/views/detail_screen.dart';

// ignore: must_be_immutable
class MainText extends StatelessWidget {
  // const MainText({ Key? key , }) : super(key: key);
  String name;
  double size;

  MainText({Key? key, required this.name, required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontFamily: "main", fontSize: size, color: Colors.black),
    );
  }
}

class SemiBold extends StatelessWidget {
  // const MainText({ Key? key , }) : super(key: key);
  String name;
  double size;
  Color? color;
  SemiBold({Key? key, required this.name, required this.size, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          fontFamily: "second", fontSize: size, color: color ?? Colors.black),
    );
  }
}

// ignore: must_be_immutable
class Regular extends StatelessWidget {
  // const MainText({ Key? key , }) : super(key: key);
  String name;
  double size;
  Color color;
  Regular(
      {Key? key, required this.name, required this.size, required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontFamily: "first", fontSize: size, color: color),
    );
  }
}

// todo card widgets

// ignore: must_be_immutable
class CardView extends StatelessWidget {
  CardView({
    Key? key,
    required this.image,
    required this.title,
    required this.id,
    required this.img,
    required this.disc,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final image;
  String title, id;
  String disc;
  String img;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    description: disc,
                    img: img,
                    name: title,
                    heroTag: id,
                  )),
        );
      },
      child: Stack(
        children: [
          Hero(
              tag: id,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    image,
                    height: 190,
                    width: 190,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 170,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.2)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        AppLocalization.of(context)
                            .getTranslatedValue(title)
                            .toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
