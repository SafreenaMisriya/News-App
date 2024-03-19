import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class Newsrepository {
  Future<List<NewsModel>> fetchNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=35fac5319bd343e6887e91b1c0e86c1d"));

    var data = jsonDecode(response.body);

    List<NewsModel> articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        NewsModel artcileModel = NewsModel.fromJson(item);

        articleModelList.add(artcileModel);
      }
      return articleModelList;
    } else {
      return articleModelList;
    }
  }
}
