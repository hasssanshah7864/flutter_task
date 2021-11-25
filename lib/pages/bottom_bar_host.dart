import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/helper/custom_loader.dart';
import 'package:flutter_task/helper/locolizations.dart';
import 'package:flutter_task/helper/utilities.dart';
import 'package:flutter_task/pages/search.dart';

import 'home.dart';

class BottomBarHost extends StatefulWidget {

  @override
  _BottomBarHostState createState() => _BottomBarHostState();
}

class _BottomBarHostState extends State<BottomBarHost> {
  late Helper helper;
  bool isInit = false;
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      isInit = true;
      helper = Helper(context, showProgressDialog, updateState);

    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              helper.buildStatusBar(),
              helper.buildTabBody(),
              helper.buildBottomBar(),
              helper.buildSafeArea(),
            ],
          ),
          CustomLoader(showLoading: showLoading, loaderColor: Color(0xFF159588),),
        ],
      ),
    );
  }

  void showProgressDialog(bool isShow) {
    if (mounted) {
      setState(() {
        showLoading = isShow;
      });
    }
  }

  void updateState(){
    setState(() {

    });
  }
}

class Helper{
  late BuildContext context;
  late Function showProgressDialog, updateState;
  late Home homeTab;
  late Search searchTab;
  int stactIndexValue = 0;


  Helper(this.context, this.showProgressDialog, this.updateState){
    homeTab = Home();
    searchTab = Search();
  }

  Widget buildStatusBar(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).padding.top,
      color: Theme.of(context).primaryColorDark,
    );
  }

  Widget buildSafeArea(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).padding.bottom,
      color: Utilities.safeAreaColor,
    );
  }

  Widget buildTabBody(){
    return Expanded(
      child: IndexedStack(
        index: stactIndexValue,
        children: [
          homeTab,
          searchTab,
        ],
      ),
    );
  }

  Widget buildBottomBar(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [new BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 8.0,
            offset: Offset(0, -0.5)
        ),],
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                stactIndexValue = 0;
                FocusScope.of(context).requestFocus(FocusNode());
                updateState();
              },
              child: Container(
                child: SvgPicture.asset(
                  stactIndexValue == 0 ? 'assets/images/Icon_material_home.svg'
                  : 'assets/images/Icon_material_home_inactive.svg',
                  width: 22,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                FocusScope.of(context).requestFocus(FocusNode());
                stactIndexValue = 1;
                updateState();
              },
              child: Container(
                child: SvgPicture.asset(
                  stactIndexValue == 1 ? 'assets/images/Icon_material_search.svg'
                  : 'assets/images/icon_material_search_inactive.svg',
                  width: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
