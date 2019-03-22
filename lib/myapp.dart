import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_uikit/ui/page/home_page.dart';
import 'package:flutter_uikit/ui/page/notfound/notfound_page.dart';
import 'package:flutter_uikit/ui/page/trophies/product_detail_page.dart';
import 'package:flutter_uikit/ui/page/trophies/shopping_details_page.dart';
import 'package:flutter_uikit/ui/page/trophies/baseball_2019_page.dart';
import 'package:flutter_uikit/ui/page/trophies/baseball_2018_page.dart';
import 'package:flutter_uikit/utils/translations.dart';
import 'package:flutter_uikit/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: HomePage(),
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("hi", "IN"),
      ],
      // initialRoute: UIData.notFoundRoute,

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(),
        UIData.notFoundRoute: (BuildContext context) => NotFoundPage(),
        UIData.baseball2019Route: (BuildContext context) => Baseball2019Page(),
        UIData.baseball2018Route: (BuildContext context) => Baseball2018Page(),
        UIData.shoppingTwoRoute: (BuildContext context) => ShoppingDetailsPage(),
        UIData.shoppingThreeRoute: (BuildContext context) => ProductDetailPage(),
      },
      onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
          builder: (context) => new NotFoundPage(
                appTitle: UIData.coming_soon,
                icon: FontAwesomeIcons.solidSmile,
                title: UIData.coming_soon,
                message: "Under Development",
                iconColor: Colors.green,
              )));

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
