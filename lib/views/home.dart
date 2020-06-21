import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsworm/helper/data.dart';
import 'package:newsworm/helper/news.dart';
import 'package:newsworm/main.dart';
import 'package:newsworm/models/article_model.dart';
import 'package:newsworm/models/cotegori_models.dart';
import 'package:newsworm/views/article_views.dart';

import 'category_news.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategoryModel> categories= new List<CategoryModel>();
  List<ArticleModel> articles=List<ArticleModel>();
  bool _loading=true;

  @override
  void initState() {

    super.initState();
    categories=getCategories();
    getNews();
  }

  getNews() async{
    News newsClass=News();
    await newsClass.getnews();
    articles=newsClass.news;
    setState(() {
      _loading=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            Text("Newsworm" ),

          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    body: _loading ?Container(
      child: CircularProgressIndicator(),

    ):SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child:Column(
          children: <Widget>[
            ///Categories
          Container(

            height: 70,
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
              return CatergoryTile(imageUrl: categories[index].imageUrl,
              categoryname: categories[index].categoryname,);
            },
            ),
          ),
            ///Blogs
            Container(
              padding: EdgeInsets.only(top: 16),
              child: ListView.builder(
                  itemCount:articles.length,
                  shrinkWrap:true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context,index){
                  return BlogTile(
                    imageUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description,
                    url: articles[index].url,
                  );

              }),
            ),
        ],
      ) ,
      ),
    ),
    );
  }
}

class CatergoryTile extends StatelessWidget {
  final String imageUrl, categoryname;
  CatergoryTile({this.imageUrl,this.categoryname});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder:(context)=>CategoryNews(
              category: categoryname.toLowerCase(),
            )));
      },
      child: Container(

        margin: EdgeInsets.only(right: 16.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,width: 120,height:60,fit: BoxFit.cover,),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,

              ),
              width: 120,
              height:60,

              child: Text(categoryname,style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}


class BlogTile extends StatelessWidget{
  final String imageUrl,title,desc,url;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ArticleView(
            blogUrl: url,
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(imageUrl)),
            SizedBox(height: 8,),
            Text(title,style: TextStyle(
              fontSize: 18 ,
              color: Colors.black87,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 8,),
            Text(desc,style: TextStyle(
              color: Colors.black54,
            ),),

          ],
        ),
      ),
    );
  }
}