import 'dart:convert';

import 'package:crud_app/cubit/states.dart';
import 'package:crud_app/helper/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../modules/user.dart';

class UserCubit extends Cubit<dynamic>
{
  final String url = 'https://gorest.co.in/public/v2/users';
  List<User> users =[];
  UserCubit() : super(UserListLoading());

  //UserCubit({required this.url}) : super(UserListLoading());
  Future<void>DisplayUsers()async{
    emit(UserListLoading());
   try{
     List<dynamic> data = await Api().get(url: url) ;

     data.forEach((element) {
       User user = User(
         id : element['id'],
         name: element['name'],
         gender: element['gender'],
         email: element['email'],
         status: element['status'],
       );
       users.add(user);
     });
     /*data.forEach((key, value){
       User user = User(
         id : value['id'],
         name: value['name'],
         gender: value['gender'],
         email: value['email'],
         status: value['status'],
       );
       users.add(user);
     });*/
     /*print(users.length);
     users.forEach((element) {
       print("hello");
       print(element.name);
     });*/
     emit(UserListLoaded());
   }catch (e){
     emit(UserListError(e.toString()));
   }
  }

  Future<void> CreateUser(Map<String,dynamic> body) async{
    emit(UserFormEmpty());
    try{
      print('Request Body: $body');
      Map<String,dynamic> data = await Api().post(url: url, body: json.encode(body));
      //Map<String, dynamic> userData = data['data'];
      //print('Response userData: $userData');
      print('Response Data: $data');
      User user = User(
        id: data['id'],
        name: data['name'],
        gender: data['email'],
        email: data['gender'],
        status: data['status'],
      );
      print(users.length);
      users.add(user);
      print(users.length);
      emit(UserListLoaded());
      emit(UserFormSuccess());
    }catch (e){
      emit(UserFormError(e.toString()));
    }
  }

  Future<void> UpdateUser(Map<String,dynamic> body) async{
    emit(UserFormEmpty());
    try{
      Map<String,dynamic> data = await Api().put(url: url, body: json.encode(body));
      emit(UserFormSuccess());
    }catch (e){
      emit(UserFormError(e.toString()));
    }
  }
}