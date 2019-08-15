import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() {
    return _NavigationPageState();
  }
}

class _NavigationPageState extends State<NavigationPage> {
  List _imageUrls = [
    'http://a1.att.hudong.com/62/83/01300000246938129401837815165.jpg',
    'http://old.bz55.com/uploads/allimg/140709/1-140FZ92221.jpg',
    'https://cdn.imagecurl.com/images/87382569343030677585_medium.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 200,
                  child: Swiper(
                    itemCount: 3,
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildSwiperItem(_imageUrls[index]);
                    },
                  ),
                ),
              ],
            )));
  }

  Widget _buildTreeItem() {
    return Card();
  }

  Widget _buildSwiperItem(String url){
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 200,
            child: Swiper(
              itemCount: 3,
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(_imageUrls[index],
                    fit: BoxFit.fill);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            child: Text(url,style: TextStyle(color: Colors.white),maxLines: 1,),
          )
        ],
      ),
    );
  }
}
