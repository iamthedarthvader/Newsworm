import 'dart:convert';

import 'package:newsworm/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news=[];

  Future<void> getnews() async{
    String url="http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=cfdc2199e50c4bcd8e5e484220f16763";
    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
      if(element["urlToImage"]!=null && element["description"]!=null){
        ArticleModel articleModel=ArticleModel(
          title: element['title'],
          author: element["author"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["content"],
        );
        news.add(articleModel);
      }

    }
    );
    }
  }



}
class CategoryNewsClass{
  List<ArticleModel> news=[];

  Future<void> getNews(String category) async{
    String url="http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=cfdc2199e50c4bcd8e5e484220f16763";
    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null){
          ArticleModel articleModel=ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }

      }
      );
    }
  }



}