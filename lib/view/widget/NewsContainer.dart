import 'package:flutter/material.dart';
import 'package:news_app_flutter/view/detail_view.dart';

class NewsContainer extends StatelessWidget {

  String imageUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;
  NewsContainer({required this.imageUrl, required this.newsHead,  required this.newsDes, required this.newsCnt, required this.newsUrl});
 

  @override
  Widget build(BuildContext context) {
   
   

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(imageUrl,height: 400, width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
            SizedBox(height: 20.0,),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Text(
                      newsHead.length>70?
                      "${newsHead.substring(0,70)}...":newsHead,
                      style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)),
                     SizedBox(height: 20.0,),
                     Text(newsDes, style: TextStyle(fontSize: 15.0,color: Colors.grey)),
                     SizedBox(
                      height: 10,
                     ),
                     Text(
                      newsCnt.length>250 ? newsCnt.substring(0,250) :
                     "${newsCnt.toString().substring(0,newsCnt.length-15)}...", 
                     style: TextStyle(fontSize: 18.0)),
                  ]
                  
                ),
              ),
            ),
           
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                           onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailViewScreen(newsUrl: newsUrl), ),);
                           }, 
                  child: Text("Read More")),
                ),
              ],
            ),
                SizedBox(height: 20.0,),

          ],
        )
       );
  }
}