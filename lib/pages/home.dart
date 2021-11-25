import 'package:flutter/material.dart';
import 'package:flutter_task/helper/locolizations.dart';
import 'package:flutter_task/pages/country_detail.dart';

class Home extends StatelessWidget {
  late Helper helper;

  @override
  Widget build(BuildContext context) {
    helper = Helper(context);
    return Container(
      child: Column(
        children: [
          helper.buildWorldTitle(),
          helper.buildCountriesList(),
        ],
      ),
    );
  }
}

class Helper{
  BuildContext context;
  List<String> countries = [];

  Helper(this.context){
    countries.add(AppLocalizations.of(context)!.trans('afghanistan'));
    countries.add(AppLocalizations.of(context)!.trans('australia'));
    countries.add(AppLocalizations.of(context)!.trans('austria'));
    countries.add(AppLocalizations.of(context)!.trans('austria'));
    countries.add(AppLocalizations.of(context)!.trans('gibraltar'));
    countries.add(AppLocalizations.of(context)!.trans('lithuania'));
    countries.add(AppLocalizations.of(context)!.trans('malaysia'));
    countries.add(AppLocalizations.of(context)!.trans('nauru'));
    countries.add(AppLocalizations.of(context)!.trans('qatar'));
    countries.add(AppLocalizations.of(context)!.trans('palestinian_territory'));
    countries.add(AppLocalizations.of(context)!.trans('turkey'));
    countries.add(AppLocalizations.of(context)!.trans('pakistan'));
    countries.add(AppLocalizations.of(context)!.trans('gambia'));
    countries.add(AppLocalizations.of(context)!.trans('iran'));
    countries.add(AppLocalizations.of(context)!.trans('sri_lanka'));
    countries.add(AppLocalizations.of(context)!.trans('saudi_arabia'));
    countries.add(AppLocalizations.of(context)!.trans('india'));
  }

  Widget buildWorldTitle(){
    return Container(
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 27,
        bottom: 15
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.trans('world').toUpperCase(),
            style: TextStyle(
              color: Color(0xFF424242),
              fontSize: 23,
              fontWeight: FontWeight.w700
            ),
          ),
          Text(
            '10',
            style: TextStyle(
              color: Color(0xFF424242),
              fontSize: 23,
              fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCountriesList(){
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        physics: ClampingScrollPhysics(),
        itemCount: countries.length,
        itemBuilder: (_, index){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CountryDetail(country: countries[index])));
            },
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 0.8,
                    color: Color(0xFFD9D9D9),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 11
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            countries[index],
                            style: TextStyle(
                                color: Color(0xFF424242),
                                fontSize: 17.8,
                                fontWeight: FontWeight.w500
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '10',
                          style: TextStyle(
                              color: Color(0xFF424242),
                              fontSize: 17.8,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 0.8,
                    color: Color(0xFFD9D9D9),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


