 //https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=a6db2f1b8f024226a541f69a136563e1

import 'package:http/http.dart';
 import 'package:flutter/material.dart';
 import 'dart:convert';
 import 'dart:math';

import 'package:news_app_flutter/model/newsArt.dart';

class FetchNews{
    static List sourcesId = [
    "abc-news",
 
    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
   
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",
    
    "national-geographic",
 
    "news24",
    "new-scientist",
   
    "new-york-magazine",
    "next-big-future",
  
    "techcrunch",
    "techradar",
   
    "the-hindu",
   
    "the-wall-street-journal",
    
    "the-washington-times",
    "time",
    "usa-today",
    
  ];
  static Future<NewsArt>fetchNews() async{
    final _random=new Random();

  var element =sourcesId[_random.nextInt(sourcesId.length)];
  print(element);
    Response response= await get(Uri.parse('https://newsapi.org/v2/top-headlines?sources=$element&apiKey=a6db2f1b8f024226a541f69a136563e1'));
    
    Map body_data=jsonDecode(response.body);
    List articles=body_data["articles"];
    //print(articles);

    final _Newrandom= new Random();
    var myArticle= articles[_Newrandom.nextInt(articles.length)];
    print(myArticle);

    return NewsArt.fromAPItoApp(myArticle);
 }

}
