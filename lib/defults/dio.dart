
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

 class DioHelper {

  static Dio dio ;
    static init(){
      dio = Dio(
        BaseOptions(
       baseUrl: '' ,
       receiveDataWhenStatusError: true ,

      ),
      );
    }


  static Future<Response> GetData({

   @required String url ,
      @required Map<String , dynamic> query ,
 }) async{
      return await dio.get(url , queryParameters:query,);


 }
}



//https://www.theengineeringprojects.com/2016/11/examples-of-embedded-systems.html