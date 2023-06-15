import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:visnu_god/data/data.dart';
import 'package:visnu_god/data/widgets.dart';
import 'package:visnu_god/utils/controller.dart';
import 'package:visnu_god/utils/language_model.dart';
import 'package:visnu_god/utils/localization.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      AppLocalization.of(context)
                          .getTranslatedValue("full_title")
                          .toString(),
                      style: const TextStyle(
                          fontSize: 25, color: Color(0xffA5A5A5)),
                    ),
                  ),
                  DropdownButton<Language>(
                    underline: const SizedBox(),
                    padding: EdgeInsets.zero,
                    icon: Image.asset(
                      "assets/images/language.png",
                      height: 30,
                      color: Colors.white,
                    ),
                    onChanged: (Language? newValue) {
                      print("click");
                      Get.find<HomeController>()
                          .updateLocale(_changeLanguage(newValue!, context));
                    },
                    items: Language.languageList()
                        .map<DropdownMenuItem<Language>>((Language value) {
                      return DropdownMenuItem<Language>(
                        value: value,
                        child: Text(value.name.toString()),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            Expanded(
              child: AnimationLimiter(
                child: StaggeredGridView.countBuilder(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                  itemCount: titleList.length,
                  crossAxisCount: 2,
                  itemBuilder: (c, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      child: ScaleAnimation(
                        duration: const Duration(milliseconds: 1000),
                        child: FadeInAnimation(
                          child: Padding(
                            padding: EdgeInsets.only(top: index == 1 ? 60 : 0),
                            child: CardView(
                              image: imageList[index],
                              title: titleList[index],
                              id: titleList[index],
                              img: imageList[index],
                              disc: desriptionList[index],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (i) => const StaggeredTile.fit(1),
                ),
              ),
            )
          ],
        ));
  }
}

Locale _changeLanguage(Language language, context) {
  // Use a map to lookup the locale for the given language code.
  print("click here");
  final locales = {
    "hi": const Locale("hi", "IN"),
    "en": const Locale("en", "US"),
  };

  // Return the locale for the given language code, or the default locale if the language code is not found.
  return locales[language.languageCode] ?? Locale(language.languageCode, "US");
}
