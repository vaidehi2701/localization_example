import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:visnu_god/utils/controller.dart';
import 'package:visnu_god/utils/localization.dart';
import 'package:visnu_god/views/homePage.dart';

void main() {
  runApp(const MyApp());
}
  //devDiariesWithVee on Instagram
 //devDiariesWithVee on Youtube
 //vaidehi2701 on Github/Linkedin
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) => MaterialApp(
        locale: controller.locale,
        debugShowCheckedModeBanner: false,
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalization.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('hi', 'IN'),
        ],
        home: const Home(),
      ),
    );
  }
}
