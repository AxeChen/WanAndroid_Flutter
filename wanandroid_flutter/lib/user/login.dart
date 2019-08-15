import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.close,color: Colors.grey,size: 40,),
              ),
              Align(
                alignment: Alignment.centerLeft,

                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    "登录",
                    style: TextStyle(fontSize: 50, color: Colors.blue),
                  ),
                )
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "登录玩安卓，一起玩安卓！",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        icon: Icon(Icons.people),
                        hintText: "请输入用户名",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          hintText: "请输入密码",
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: MaterialButton(
                        minWidth: 500,
                        height: 40,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text(
                          "登录",
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "还没有账号？点这里注册",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
