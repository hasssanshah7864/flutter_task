import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/pages/bottom_bar_host.dart';


class Splash extends StatelessWidget {
  late Helper helper;
  bool isInit = false;

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      isInit = true;
      helper = Helper(context);
    }
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: helper.buildBody(),
    );
  }
}

class Helper {
  BuildContext context;
  //Language language;
  int count = 1;
  bool isRemember = false, isSettingsLoaded = false, isFeaturesLoaded = false;

  Helper(this.context) {
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomBarHost()),
              (Route<dynamic> route) => false);
    });
  }

  Widget buildBody() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/splash_bg.jpeg',
            ),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: CircularProgressIndicator(
              valueColor:
                  new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
        ));
  }
}
