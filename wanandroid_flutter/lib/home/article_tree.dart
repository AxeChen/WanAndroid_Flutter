import 'package:flutter/material.dart';

class ArticleTreePage extends StatefulWidget {
  @override
  _ArticleTreePageState createState() {
    return _ArticleTreePageState();
  }
}

class _ArticleTreePageState extends State<ArticleTreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        _buildArticleTreeItem(),
        _buildArticleTreeItem(),
        _buildArticleTreeItem(),
        _buildArticleTreeItem(),
        _buildArticleTreeItem(),
        _buildArticleTreeItem(),
        _buildArticleTreeItem(),
        _buildArticleTreeItem(),
        _buildArticleTreeItem(),
      ],
    ));
  }

  Widget _buildArticleTreeItem() {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey,width: 0.1))),
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "文章体系",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
