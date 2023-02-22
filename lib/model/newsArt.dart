import 'package:flutter/material.dart';

class NewsArt{

String imgUrl;
String newsDes;
String newsCnt;
String newsHead;
String newsUrl;

NewsArt({required this.imgUrl, required this.newsCnt, required this.newsDes, required this.newsHead, required this.newsUrl});
  

  static NewsArt fromAPItoApp(Map<String, dynamic> article){
   return NewsArt(
    imgUrl: article["urlToImage"]?? Image.asset('nullpic.jpg'),
     newsCnt: article["content"]?? "--", 
      newsDes: article["description"]?? "--",
     newsHead: article["title"]?? "--", 
     newsUrl: article["url"]??"https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
    
     );
  }

}