import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/helper/custom_loader.dart';
import 'package:flutter_task/helper/locolizations.dart';
import 'package:flutter_task/helper/utilities.dart';
import 'package:flutter_task/pages/search.dart';

import 'home.dart';

class CountryDetail extends StatefulWidget {
  String country;

  CountryDetail({required this.country});

  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  late Helper helper;
  bool isInit = false;
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    if (!isInit) {
      isInit = true;
      helper = Helper(context, showProgressDialog, updateState, widget.country);

    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              helper.buildStatusBar(),
              helper.buildActionBar(),
              helper.buildCountryName(),
              helper.buildTotalCasesTotalDeaths(),
              helper.buildNewCasesNewDeaths(),
              helper.buildNewRecoveredTotalRecovered(),
              //helper.buildSafeArea(),
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
  String country;


  Helper(this.context, this.showProgressDialog, this.updateState, this.country){
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

  Widget buildActionBar() {
    return Container(
      height: 35.0,
      width: MediaQuery.of(context).size.width,

      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 35.0,
              margin: EdgeInsets.only(
                left: 8.5,
                right: 8.5,
              ),
              padding: EdgeInsets.all(7.2),
              child: SvgPicture.asset(
                'assets/images/Icon_material_arrow_back.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCountryName(){
    return Container(
      height: 180.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            country,
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            AppLocalizations.of(context)!.trans('corona_stats_overview').toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.9,
              fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTotalCasesTotalDeaths(){
    return Container(
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 30.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.trans('total_cases').toUpperCase(),
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 11.3,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '25,000',
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.trans('total_deaths').toUpperCase(),
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 11.3,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '1,000',
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildNewCasesNewDeaths(){
    return Container(
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 25.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.trans('new_cases').toUpperCase(),
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 11.3,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '25',
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.trans('new_deaths').toUpperCase(),
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 11.3,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '25',
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildNewRecoveredTotalRecovered(){
    return Container(
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 25.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.trans('new_recovered').toUpperCase(),
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 11.3,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '25',
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.trans('total_recovered').toUpperCase(),
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 11.3,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '25',
                  style: TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
