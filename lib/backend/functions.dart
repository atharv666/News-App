import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:technewzapp/backend/key.dart';
import 'package:technewzapp/components/searchbar.dart';


Future<List> fetchnews({String category = "technology"})async{
  final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=' + category + '&pageSize=100&apiKey=' + Key.key + '&q=' + Searchbar.searchbarcontroller.text));
  Map result = jsonDecode(response.body);
  // print("Fetched");
  log("Fetched");
  return result['articles'];
}
