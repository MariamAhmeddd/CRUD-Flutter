import 'dart:convert';

import 'package:crud_app/cubit/states.dart';
import 'package:crud_app/helper/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../modules/user.dart';

class UserCubit extends Cubit<dynamic>
{
  final String url = 'https://gorest.co.in/public/v2/users';
  static List<User> users =[];
  UserCubit() : super(UserListLoading());
  static UserCubit get(context) => BlocProvider.of(context);
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
     emit(UserListLoaded());
   }catch (e){
     emit(UserListError(e.toString()));
   }
  }

  Future<void> CreateUser(Map<String,dynamic> body) async{
    emit(UserFormEmpty());
    try{
      Map<String,dynamic> data = await Api().post(url: url, body: json.encode(body));
      User user = User(
        id: data['id'],
        name: data['name'],
        gender: data['email'],
        email: data['gender'],
        status: data['status'],
      );
      users.add(user);
      emit(UserFormSuccess());
    }catch (e){
      emit(UserFormError(e.toString()));
    }
  }

  Future<void> UpdateUser(Map<String,dynamic> body,int id) async{
    String newUrl = url + '/' + id.toString();
    try{
      Map<String,dynamic> data = await Api().put(url: newUrl, body: json.encode(body));
      emit(UserFormSuccess());
    }catch (e){
      emit(UserFormError(e.toString()));
    }
  }

  Future<void> DeleteUser(int id) async{
    String newUrl = url + '/' + id.toString();
    try{
      dynamic data = await Api().delete(url: newUrl);
      emit(UserFormSuccess());
    }catch (e){
      emit(UserFormError(e.toString()));
    }
  }
}