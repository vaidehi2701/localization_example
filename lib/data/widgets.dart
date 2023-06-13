import 'package:flutter/material.dart';
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
  CardView(
      {Key? key,
      required this.icon,
      required this.secondimage,
      required this.title,
      required this.family,
      required this.id,
      required this.img,
      required this.name,
      required this.disc,
      required this.country})
      : super(key: key);
  final icon;
  // ignore: prefer_typing_uninitialized_variables
  final secondimage;
  String title, family, id, country;
  var disc;
  var img;
  var name;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    country: country,
                    description: disc,
                    img: img,
                    name: name,
                    num: id,
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffF2F3F5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Hero(
                  tag: id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      secondimage,
                      height: 190,
                      width: 190,
                      fit: BoxFit.cover,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

