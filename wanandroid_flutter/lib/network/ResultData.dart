/// 请求返回的封装类
class ResultData{
  /// 状态码
  int errorCode;
  /// 错误信息
  String errorMsg;
  var data;

  ResultData.fromJson(Map<String, dynamic> json)
      : errorCode = json["errorCode"],
        errorMsg = json["errorMsg"],
        data = json["data"];

  Map<String, dynamic> toJson() => {
    "code": errorCode,
    "errorMsg": errorMsg,
    "data": data,
  };
}