import 'dart:convert';
import 'dart:math';


import 'package:http/http.dart';
import 'package:riverpod_examples_v1/usermodel.dart';

class ApiService{

  String endpoint='https://6354142fe64783fa827edb6c.mockapi.io/api/v1/user';



  Future<List<UserModel>> getUsers()async{
   
   Response response=await get(Uri.parse(endpoint));
   if (response.statusCode==200){

    final List result=jsonDecode(response.body);

   
    return result.map(((e)=>UserModel.fromJson(e))).toList();
   }else {
    
    throw Exception(response.reasonPhrase);
   }
    
  }
}