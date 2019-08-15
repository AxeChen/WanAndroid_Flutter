import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/bean/ProjectList.dart';
import 'package:wanandroid_flutter/network/DioClient.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() {
    return _ProjectPageState();
  }
}

class _ProjectPageState extends State<ProjectPage> {

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 35),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.5))),
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text(
                          "当前分类：",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text(
                          "全部项目",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          )),
                    ],
                  )),
              Expanded(
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: ListView.builder(
                          controller: scrollController,
                          itemCount: projects.length + 1,
                          itemBuilder: _buildProjectItem),
                    ),
                  )),
            ],
          )),
    );
  }


  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('滑动到了最底部${scrollController.position.pixels}');
        setState(() {
          showMore = true;
        });
        loadMore();
      }
    });
    _onRefresh();
  }

  int pageIndex = 0;
  List<Datas> projects = List();
  bool showMore = false;

  Future<void> _onRefresh() async {
    pageIndex = 0;
    getProject();
  }
  void loadMore() async {
    setState(() {
      pageIndex++;
    });
    getProject();
  }

  void getProject() async{
    DioClient.initRequest().get("article/listproject/$pageIndex/json").then((
        result) {
      ProjectList projectList = ProjectList.fromJson(result.data);
      print("dddddddddddddddd");
      setState(() {
        if (pageIndex == 0) {
          projects.clear();
          showMore = false;
        }
        projects.addAll(projectList.datas);

      });

    }).catchError((error) {

    });
  }

  Widget _buildProjectItem(BuildContext context, int index) {
    TextStyle textStyle = TextStyle(fontSize: 12, color: Colors.grey);
    if (index < projects.length) {
      Datas datas = projects[index];
      return Card(
        elevation: 0.5,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      child: Image.network(
                        datas.envelopePic,
                        fit: BoxFit.fitWidth,
                        height: 150,
                        width: double.infinity,
                      ),
                    )),
                Container(
                    margin:
                    EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        ClipOval(
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.network(
                              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3018968254,2801372361&fm=26&gp=0.jpg",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "张弘扬",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                "候没有选择到魅族快应用引擎就不会被检测到时魅族的快应用。现在桌面上是两个快应用图标",
                maxLines: 2,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 16, bottom: 10, top: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "分类：",
                    style: textStyle,
                  ),
                  Text(
                    "原创文章/技术周刊",
                    style: textStyle,
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "时间：",
                          style: textStyle,
                        ),
                        Text(
                          "1小时前",
                          style: textStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }else if (showMore) {
      return _getLoadItem(context, index);
    } else {
      return null;
    }
  }

  Widget _getLoadItem(BuildContext context, int index) {
    return Container(
      height: 80,
      width: double.infinity,
      child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("正在加载")
              ),

            ],
          )),
    );
  }
}
