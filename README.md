
# 🚀 flutter_search_view_pk

A **custom search view** for Flutter with auto-complete suggestions and easy API integration — inspired by Instagram’s search experience.

This widget is fully customizable and can be easily plugged into any Flutter project.

![Demo GIF](https://user-images.githubusercontent.com/45510447/86524982-c7895d80-be9e-11ea-92ab-6608c5e73831.gif)

---

## 🧩 How to Integrate

1. **Drag and drop** the `pk_search_bar` directory directly into your Flutter project.

2. **Create a `SearchScreen` class** and use `SearchBar()` inside the `Scaffold`.

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SearchScreen(),
  ),
);
```

---

## 💡 Example Usage

```dart
class SearchScreen extends StatefulWidget {
  final List<CountryModel> countryModelList;
  const SearchScreen(this.countryModelList);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: searchBar(context),
        ),
      ),
    );
  }

  /// Main Search Widget
  Widget searchBar(BuildContext context) {
    return SearchBar<CountryModel>(
      searchBarPadding: const EdgeInsets.all(10),
      headerPadding: EdgeInsets.zero,
      listPadding: EdgeInsets.zero,
      hintText: "Search Placeholder",
      hintStyle: const TextStyle(color: Colors.black54),
      textStyle: const TextStyle(color: Colors.black),
      iconActiveColor: Colors.deepPurple,
      shrinkWrap: true,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      suggestions: widget.countryModelList,
      cancellationWidget: const Text("Cancel"),
      minimumChars: 1,
      emptyWidget: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("There is no data found"),
        ),
      ),
      onError: (error) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("\$error", textAlign: TextAlign.center),
        ),
      ),
      loader: const Center(child: LoadingIndicator()),
      onSearch: getCountrySearchWithSuggestion,
      onCancelled: () => Navigator.pop(context),
      buildSuggestion: (country, index) => countryGenerateColumn(country, index),
      onItemFound: (country, index) => countryGenerateColumn(country, index),
    );
  }

  /// Search Result UI Widget
  Widget countryGenerateColumn(CountryModel country, int index) => InkWell(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 50),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(8, 5, 0, 5),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(country.countryName, maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(country.countryCode, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                  const Divider(height: 0.5),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  /// For local list search
  Future<List<CountryModel>> getCountrySearch(String search) async {
    if (search == "empty") return [];
    if (search == "error") throw Error();
    return widget.countryModelList.where((country) {
      final name = country.countryName.toLowerCase();
      final code = country.countryCode.toLowerCase();
      final term = search.toLowerCase();
      return name.contains(term) || code.contains(term);
    }).toList();
  }

  /// With suggestion support
  Future<List<CountryModel>> getCountrySearchWithSuggestion(String search) async {
    if (search == "empty") return [];
    if (search == "error") throw Error();
    final filterList = widget.countryModelList.where((country) {
      final name = country.countryName.toLowerCase();
      final code = country.countryCode.toLowerCase();
      final term = search.toLowerCase();
      return name.contains(term) || code.contains(term);
    }).toList();
    return search.isEmpty ? widget.countryModelList : filterList;
  }

  /*
  /// Uncomment if you want to search via API
  Future<List<CountryModel>> getCountryListFromApi(String search) async {
    final params = {
      "search_value": search,
      "user_token": "",
    };

    final response = await ApiManager.instance.postAPICall(
      BASE_URL_Local + get_search_country_list,
      params,
      context,
    );

    final data = response["data"];
    return data.map<CountryModel>((u) => CountryModel(u["countryName"], u["countryCode"])).toList();
  }
  */
}
```

---

## 🔗 Inspired by

This package was originally inspired by:  
👉 [flappy_search_bar by SmartnSoft](https://github.com/smartnsoft/flappy_search_bar)

---

## 👨‍💻 Maintained By

**Paresh Mangukiya**  
📧 Email: [pkmangukiya@gmail.com](mailto:pkmangukiya@gmail.com)  
🐙 GitHub: [github.com/pkmangukiya](https://github.com/pkmangukiya)  
🔗 LinkedIn: [pareshmangukiya](https://in.linkedin.com/in/pareshmangukiya)

---

## 🤝 Contributions

Pull requests are welcome!  
Feel free to open issues for suggestions, improvements, or bug reports.

---
