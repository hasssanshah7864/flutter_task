import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/helper/locolizations.dart';

import 'country_detail.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Helper helper;
  bool isHelperInit = false;

  @override
  Widget build(BuildContext context) {
    if(!isHelperInit){
      helper = Helper(context, updateState);
      isHelperInit = true;
    }
    return Container(
      child: Column(
        children: [
          helper.buildSearchField(),
          helper.buildCountriesList(),
        ],
      ),
    );
  }

  void updateState(){
    setState(() {

    });
  }
}

class Helper{
  BuildContext context;
  Function updateState;
  List<String> countries = [];
  List<String> searchCountries = [];
  String searchFieldText = '';

  Helper(this.context, this.updateState){
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

  Widget buildSearchField(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 18,
        bottom: 15
      ),

      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF0F0F0),
          borderRadius: BorderRadius.all(Radius.circular(4))
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 14,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/Icon_material_search_dark.svg',
              width: 19,
            ),
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.trans('search'),
                  hintStyle: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.all(0.0),
                ),
                style: TextStyle(
                    color: Color(0xFF424242),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                onChanged: (value){
                  searchCountries = [];
                  searchFieldText = value;
                  for(var country in countries){
                    if(country.toLowerCase().contains(value.toLowerCase().trim())){
                      searchCountries.add(country.substring(0));

                    }
                  }
                  print(searchFieldText);
                  print(searchCountries);
                  updateState();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCountriesList(){
    return Expanded(
      child: searchFieldText.isNotEmpty && searchCountries.isEmpty ? buildNoDataText() : ListView.builder(
        padding: EdgeInsets.all(0),
        physics: ClampingScrollPhysics(),
        itemCount: searchFieldText.trim().isEmpty ? countries.length : searchCountries.length,
        itemBuilder: (_, index){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CountryDetail(country: searchFieldText.isEmpty ? countries[index] : searchCountries[index])));
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
                            searchFieldText.trim().isEmpty ? countries[index] : searchCountries[index],
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

  Widget buildNoDataText() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.trans('no_countries_against_search_keyword'),
          style: TextStyle(
            color: Color(0xFF666666),
            fontSize: 20.0,
            fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


