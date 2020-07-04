# flutter_search_view_pk


A search view with auto-complete suggestions. and Easiest way to search from API

Awesome search view, written in Flutter(Dart), appears search view like Instagram Search view. You can fully customize this repository. You can use this repository with any flutter! project See usage in below

How to integreat source?
Directly drag and drop the pk_search_bar directory into your Flutter project.

  Widget countrySearchBar(BuildContext context) {
    return SearchBar<CountryModel>(
      searchBarPadding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
      headerPadding: EdgeInsets.only(left: 0, right: 0),
      listPadding: EdgeInsets.only(left: 0, right: 0),
      hintText: searchPlaceholder,
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
