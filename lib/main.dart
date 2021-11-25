import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter\_localizations/flutter\_localizations.dart';
import 'package:flutter_task/pages/splash.dart';

import 'helper/application.dart';
import 'helper/localizations_delegate.dart';
import 'helper/utilities.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  late AppLocalizationsDelegate _appLocalizationsDelegate;

  late Locale appLocale;
  late Splash splash;
  bool isInit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      isInit = true;
      Utilities.language = 'en';
      appLocale = Locale(Utilities.language);
      setLanguage();
      splash = Splash();
      _appLocalizationsDelegate = AppLocalizationsDelegate(newLocale: Locale('en'));
      application.onLocaleChanged = onLocaleChange;

    }
    return MaterialApp(
      theme: ThemeData(
        //platform: TargetPlatform.android,
        primaryColor: Color(0xFF159588),
        primaryColorDark: Color(0xFF159588),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFF159588), //thereby3a
        ),
      ),
      supportedLocales: application.supportedLocales(),
      locale: appLocale,
      localizationsDelegates: [
        _appLocalizationsDelegate,
        const AppLocalizationsDelegate(newLocale: Locale('en')),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: splash,
      debugShowCheckedModeBanner: false,
    );
  }

  Future onLocaleChange(Locale locale) async {
    setState(() {
      Utilities.language = locale.languageCode;
      appLocale = locale;
      _appLocalizationsDelegate = AppLocalizationsDelegate(newLocale: locale);
    });
    Utilities.web_url = Utilities.base_url + Utilities.language + '/api/';
  }

  Future setLanguage() async {
    Utilities.language = 'en';
    appLocale = Locale(Utilities.language);
    onLocaleChange(appLocale);
  }

}