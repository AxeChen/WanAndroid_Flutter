import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/home/article_tree.dart';
import 'package:wanandroid_flutter/home/home.dart';
import 'package:wanandroid_flutter/home/navigation.dart';
import 'package:wanandroid_flutter/home/project.dart';
import 'package:wanandroid_flutter/home/user.dart';

// 首页导航
class TabNavigator extends StatefulWidget {
  TabNavigator({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  // viewPager需要用到的页面控制器
  final PageController _controller = PageController(
    initialPage: 0,
  );

  // 图标和文字，选中和未选中时的颜色
  final _defaultColor = Colors.grey;
  final _selectColor = Colors.blue;

  // 当前viewpager选中的下标
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          ProjectPage(),
          ArticleTreePage(),
          NavigationPage(),
          UserPage()
        ],
      ),

      // 底部的四个导航按钮（首页、项目、文章体系、导航）
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,

        // 点击回调
        onTap: (index) {
          // 点击某个导航按钮跳转到对应的界面
          _controller.jumpToPage(index);
          setState(() {
            _index = index;
          });
        },

        // 设置导航栏的个数
        items: [
          BottomNavigationBarItem(
              title: Text(
                "首页",
                style: TextStyle(
                    color: _index != 0 ? _defaultColor : _selectColor),
              ),
              icon: Icon(
                Icons.home,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: _selectColor,
              )),
          BottomNavigationBarItem(
              title: Text(
                "项目",
                style: TextStyle(
                    color: _index != 1 ? _defaultColor : _selectColor),
              ),
              icon: Icon(
                Icons.apps,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.apps,
                color: _selectColor,
              )),
          BottomNavigationBarItem(
              title: Text(
                "文章体系",
                style: TextStyle(
                    color: _index != 2 ? _defaultColor : _selectColor),
              ),
              icon: Icon(
                Icons.format_align_left,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.format_align_left,
                color: _selectColor,
              )),
          BottomNavigationBarItem(
              title: Text(
                "导航",
                style: TextStyle(
                    color: _index != 3 ? _defaultColor : _selectColor),
              ),
              icon: Icon(
                Icons.navigation,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.navigation,
                color: _selectColor,
              )),
          BottomNavigationBarItem(
              title: Text(
                "我的",
                style: TextStyle(
                    color: _index != 4 ? _defaultColor : _selectColor),
              ),
              icon: Icon(
                Icons.person,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.person ,
                color: _selectColor,
              ))
        ],
      ),
    );
  }
}
