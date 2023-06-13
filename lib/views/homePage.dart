import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(actions: [
          DropdownButton<Language>(
            onChanged: (Language? newValue) {
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
        ]),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/avatar.png",
                    fit: BoxFit.cover,
                  ),
                  Image.asset("assets/images/menu.png", fit: BoxFit.cover),
                  Image.asset("assets/images/upload.png", fit: BoxFit.cover),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SemiBold(
                      name: AppLocalization.of(context)
                          .getTranslatedValue("vishnu")
                          .toString(),
                      size: 30),
                ],
              ),
            ),
            Expanded(
                child: StaggeredGridView.countBuilder(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 10),
                    itemCount: listOfData.length,
                    crossAxisCount: 2,
                    itemBuilder: (c, index) {
                      return listOfData[index];
                    },
                    staggeredTileBuilder: (i) => const StaggeredTile.fit(1))),
          ],
        ));
  }
}

Locale _changeLanguage(Language language, context) {
  // Use a map to lookup the locale for the given language code.
  final locales = {
    "hi": const Locale("hi", "IN"),
    "en": const Locale("en", "US"),
  };

  // Return the locale for the given language code, or the default locale if the language code is not found.
  return locales[language.languageCode] ?? Locale(language.languageCode, "US");
}
