import 'package:dio/dio.dart';
import 'package:wanandroid_flutter/network/ResultData.dart';

/// 网络请求接口
class DioClient {
  var BASE_URL = "http://www.wanandroid.com/";

  Dio dio;

  /// 初始化dio参数
  DioClient.initRequest() {
    dio = new Dio(BaseOptions(
        baseUrl: BASE_URL, connectTimeout: 100000, receiveTimeout: 3000));
  }

  /// get请求
  Future<ResultData> get(url) async {
    Response response;
    ResultData resultData;
    try {
      response = await dio.get(url);
      resultData = ResultData.fromJson(response.data);
      if(resultData.errorCode==0){
            /// 正常的处理流程
          }else{
            /// 错误的处理流程

          }
    } on DioError catch (e) {
      print(e);
    }
    return resultData;
  }

  /// post请求
  Future<ResultData> post(url) async{
    Response response;
    ResultData resultData;
    try {
      response = await dio.post(url);
      resultData = ResultData.fromJson(response.data);
      if(resultData.errorCode==0){
        /// 正常的处理流程
      }else{
        /// 错误的处理流程
      }
    } on DioError catch (e) {
      print(e);
    }
    return resultData;
  }
}
