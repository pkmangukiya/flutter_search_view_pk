# flutter_search_view_pk


A search view with auto-complete suggestions. and Easiest way to search from API

Awesome search view, written in Flutter(Dart), appears search view like Instagram Search view. You can fully customize this repository. You can use this repository with any flutter! project See usage in below


![ezgif com-video-to-gif](https://user-images.githubusercontent.com/45510447/86508769-4bd8d380-be00-11ea-8b8d-9dc093af19f5.gif)

## How to integreat source?

Directly drag and drop the `pk_search_bar` directory into your Flutter project.

## Example

``` 
class SearchScreen extends StatefulWidget {

  final List<CountryModel> countryModelList;
  @override
  _SearchScreenState createState() => _SearchScreenState();

  const SearchScreen(this.countryModelList);
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Container(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: searchBar(context)),
          )),
    );
  }

  // TODO: CountrySearchBar
  Widget searchBar(BuildContext context) {
    return SearchBar<CountryModel>(
      searchBarPadding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
      headerPadding: EdgeInsets.only(left: 0, right: 0),
      listPadding: EdgeInsets.only(left: 0, right: 0),
      hintText: "Search Placeholder",
      hintStyle: TextStyle(
        color: Colors.black54,
      ),
      textStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      iconActiveColor: Colors.deepPurple,
      shrinkWrap: true,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      suggestions: widget.countryModelList,
      cancellationWidget: Text("Cancel"),
      minimumChars: 1,
//      placeHolder: Center(
//        child: Padding(
//          padding: const EdgeInsets.only(left: 10, right: 10),
//          child: Text(searchMessage, textAlign: TextAlign.center, style: CustomTextStyle.textSubtitle1(context).copyWith(fontSize: 14),),
//        ),
//      ),
      emptyWidget: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text("There is no any data found"),
        ),
      ),
      onError: (error) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text("$error", textAlign: TextAlign.center),
          ),
        );
      },
      loader: Center(
        child: LoadingIndicator(),
      ),
      onSearch: getCountrySearchWithSuggestion, /// CountrySearch  // if want to search with API then use thi ----> getCountryListFromApi
      onCancelled: () {
        Navigator.pop(context);
      },
      buildSuggestion: (CountryModel countryModel, int index) {
        return countryGenerateColumn(countryModel, index);
      },
      onItemFound: (CountryModel countryModel, int index) {
        return countryGenerateColumn(countryModel, index);
      },
    );
  }

  Widget countryGenerateColumn(CountryModel countryModel, int index) => InkWell(
    child: Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 5.0, top: 5.0, right: 5.0, bottom: 5.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(8.0, 5.0, 0.0, 5.0),
                  width: MediaQuery.of(context).size.width * .60,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(countryModel.countryName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis
                      ),
                      Text(
                        countryModel.countryCode,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Divider(height: 0.5)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );


//  Future<List<CountryModel>> getCountryListFromApi(String search) async {
//    var _param = {
//      "search_value":search,
//      "user_token": "",
//    };
//    print("Resident search = $search");
//    if (search == "empty") return [];
//    if (search == "error") throw Error();
//
//    var response = await ApiManager.instance
//        .postAPICall(BASE_URL_Local + get_search_country_list, _param, context);
//    var data = response["data"];
//    List<CountryModel> countryModelList = [];
//    for (var u in data) {
//      CountryModel countryModel = CountryModel(
//        u["countryName"],
//        u["countryCode"]
//      );
//      countryModelList.add(countryModel);
//    }
//    return countryModelList;
//  }

  Future<List<CountryModel>> getCountrySearch(String search) async {
    print("Resident search = $search");
    if (search == "empty") return [];
    if (search == "error") throw Error();
    List<CountryModel> filterCountryList = [];

    widget.countryModelList.forEach((CountryModel) {
      if (CountryModel.countryName
          .toLowerCase()
          .contains(search.toLowerCase()) ||
          CountryModel.countryCode
              .toLowerCase()
              .contains(search.toLowerCase()))
        filterCountryList.add(CountryModel);
    });

    return filterCountryList;
  }

  Future<List<CountryModel>> getCountrySearchWithSuggestion(
      String search) async {
    print("Resident search = $search");
    if (search == "empty") return [];
    if (search == "error") throw Error();
    List<CountryModel> filterCountryList = [];

    widget.countryModelList.forEach((CountryModel) {
      if (CountryModel.countryName
          .toLowerCase()
          .contains(search.toLowerCase()) ||
          CountryModel.countryCode
              .toLowerCase()
              .contains(search.toLowerCase()))
        filterCountryList.add(CountryModel);
    });

    final suggestionList =
    search.isEmpty ? widget.countryModelList : filterCountryList;

    return suggestionList;
  }
}```

