import 'package:flutter/material.dart';
import 'package:fluttersearchviewpk/Constants.dart';
class CountryModel {
  String countryName;
  String countryCode;
  @override
  String toString() {
    return '$countryName $countryCode';
  }

  CountryModel(this.countryName, this.countryCode);
}


class DataListScreen extends StatefulWidget {
  @override
  _DataListScreenState createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
//  List<CountryModel> countryModelList = [];

  List<CountryModel> countryModelList = <CountryModel>[
    CountryModel('Australia', 'AU'),
    CountryModel('Egypt', 'EG'),
    CountryModel('Germany', 'DE'),
    CountryModel('India', 'IN'),
    CountryModel('Singapore', 'SG'),
    CountryModel('United States of America', 'US')
  ];

  @override
  void initState() {
    countryModelListGlobal = countryModelList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade50,
      height: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: countryModelList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: tileViewWithIcon(
                    Icons.location_city,
                    countryModelList[index].countryName,
                    countryModelList[index].countryCode,
                    context),
              ),
            ),
          );
        },
      ),
    );
  }
  Widget tileViewWithIcon(
      IconData icon, String title, String subTitle, BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 5.0, top: 0.0, right: 5.0, bottom: 0.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 40,
              maxHeight: 60,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(icon, color: Colors.deepPurple.shade200),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 8.0, 0.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title, style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 1),
                      Text(subTitle,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}
