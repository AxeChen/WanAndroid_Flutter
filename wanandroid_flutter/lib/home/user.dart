import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/web/WebViewPage.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() {
    return _UserPageState();
  }
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              child: Image.network(
                "http://images.mutianyugreatwall.com/t/tjwxhnlrdpgfogxm.jpg",
                width: double.infinity,
                height: 240,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 56),
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  ClipOval(
                      child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3018968254,2801372361&fm=26&gp=0.jpg",
                      width: 100,
                      height: 100,
                    ),
                  )),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "AxeChen",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "若能避开猛烈的欢喜，自然也不会有悲痛的来袭。",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 56, right: 16),
              alignment: Alignment.topRight,
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.only(left: 16, right: 16),
          margin: EdgeInsets.only(top: 16, bottom: 16),
          height: 55,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.blue,
                size: 25,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "我的收藏",
                    style: TextStyle(fontSize: 16),
                  )),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          height: 50,
          padding: EdgeInsets.only(left: 16, right: 16),
          margin: EdgeInsets.only(top: 1),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.library_books,
                color: Colors.blue,
                size: 25,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "关于本应用",
                    style: TextStyle(fontSize: 16),
                  )),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewPage(
                      url: "https://flutterchina.club/", title: "flutter中文网",hideAppbar: false,)));
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            height: 50,
            padding: EdgeInsets.only(left: 16, right: 16),
            margin: EdgeInsets.only(top: 1),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.library_books,
                  color: Colors.blue,
                  size: 25,
                ),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Flutter中文网",
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          height: 50,
          padding: EdgeInsets.only(left: 16, right: 16),
          margin: EdgeInsets.only(top: 1),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.book,
                color: Colors.blue,
                size: 25,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "博客地址",
                    style: TextStyle(fontSize: 16),
                  )),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewPage(
                      url: "https://www.coolapk.com/apk/com.mg.axechen.wanandroid", title: "酷安",hideAppbar: false,)));
          },
          child:  Container(
            decoration: BoxDecoration(color: Colors.white),
            height: 50,
            padding: EdgeInsets.only(left: 16, right: 16),
            margin: EdgeInsets.only(top: 1),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.android,
                  color: Colors.blue,
                  size: 25,
                ),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Kotlin版本",
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewPage(
                      url: "https://github.com/AxeChen/WanAndroid_Flutter", title: "酷安",hideAppbar: false,)));
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            height: 50,
            padding: EdgeInsets.only(left: 16, right: 16),
            margin: EdgeInsets.only(top: 1),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.library_books,
                  color: Colors.blue,
                  size: 25,
                ),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "源码地址",
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
          ),
        ),

      ],
    ));
  }
}
