import 'package:flutter/material.dart';
import 'package:wanandroid_flutter/bean/ArticleBean.dart';
import 'package:wanandroid_flutter/network/DioClient.dart';
import 'package:wanandroid_flutter/web/WebViewPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

double appAlpha = 1;

class _HomePageState extends State<HomePage> {
  bool isLoading = false; //是否正在请求新数据
  bool showMore = true; //是否显示底部加载中提示
  bool offState = false; //是否显示进入页面时的圆形进度条
  ScrollController scrollController = ScrollController();
  bool init = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.white),
                height: 35,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          height: 40,
                          decoration: UnderlineTabIndicator(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.blue)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.search,
                                color: Colors.blue,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "点击搜索文章",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
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
                  itemCount: articleList.length + 1,
                  itemBuilder: _getArticleItem),
            ),
          )),
        ],
      ),
    );
  }

  @override
  void initState() {
    if (init) {
      return;
    }
    init = true;
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

  Future<void> _onRefresh() async {
    pageIndex = 0;
    getArticles();
  }

  ArticleListBean listBean;
  List<ArticleBean> articleList = List();
  int pageIndex = 0;

  void loadMore() async {
    setState(() {
      pageIndex++;
    });
    getArticles();
  }

  void getArticles() async {
    DioClient.initRequest()
        .get("article/list/$pageIndex/json")
        .then((resultData) {
      ArticleListBean articleBean = ArticleListBean.fromJson(resultData.data);
      setState(() {
        offState = true;
        if (pageIndex == 0) {
          articleList.clear();
          showMore = false;
        }

        articleList.addAll(articleBean.datas);
      });
    }).catchError((error) {});
  }

  Widget _getArticleItem(BuildContext context, int index) {
    TextStyle textStyle = TextStyle(fontSize: 12, color: Colors.grey);
    if (index < articleList.length) {
      var articleBean = articleList[index];
      return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewPage(
                        url: articleBean.link, title: articleBean.title,hideAppbar: false,)));
          },
          child: Card(
            elevation: 0.5,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 10),
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
                            child: Text(articleBean.author),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Offstage(
                                  offstage: (articleBean.fresh == true)
                                      ? false
                                      : true,
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    child: Text(
                                      "最新",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.redAccent),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.redAccent,
                                            width: 0.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    margin: EdgeInsets.all(3),
                                  ),
                                ),
                                Offstage(
                                    offstage: true,
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      child: Text("置顶",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.redAccent)),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.redAccent,
                                              width: 0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4))),
                                      margin: EdgeInsets.all(3),
                                    )),
                                Offstage(
                                    offstage: (articleBean.projectLink == null)
                                        ? false
                                        : true,
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      child: Text("项目",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.green)),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.green, width: 0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4))),
                                      margin: EdgeInsets.all(3),
                                    )),
                                Container(
                                  child: Icon(
                                    Icons.favorite,
                                    color: (articleBean.collect)
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      articleBean.title,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 16, bottom: 10, top: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "分类：",
                          style: textStyle,
                        ),
                        Text(
                          "${articleBean.superChapterName}/${articleBean.chapterName}",
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
            ),
          ));
    } else if (showMore) {
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
              Container(margin: EdgeInsets.only(left: 10), child: Text("正在加载")),
            ],
          )),
    );
  }
}
