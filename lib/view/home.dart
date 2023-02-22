import 'package:flutter/material.dart';
import 'package:news_app_flutter/controller/fetchNews.dart';
import 'package:news_app_flutter/model/newsArt.dart';
import 'package:news_app_flutter/view/widget/NewsContainer.dart';
import 'package:news_app_flutter/controller/fetchNews.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 late NewsArt newsArt;
 Getnews()async{
    
   newsArt=await FetchNews.fetchNews();
   setState(() {
     
   });

 }

 @override
  void initState() {
    Getnews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
        onPageChanged: (value){ Getnews();},
        itemBuilder: (context,index){
         
       return NewsContainer(
        imageUrl: newsArt.imgUrl, 
        newsCnt: newsArt.newsCnt,
       newsDes: newsArt.newsDes,
       newsHead: newsArt.newsHead,
        newsUrl: newsArt.newsUrl,
        );
        },
        ),
    );
  }
}
