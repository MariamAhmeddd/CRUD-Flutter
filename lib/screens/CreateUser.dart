import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'Home.dart';



class CreateUser extends StatelessWidget {
  @override

  var name,email,gender,status;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();


  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,dynamic>(
      listener: (context,state){
        if(state is UserFormSuccess)
        {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        }
        else if(state is UserFormError) {
          String error = state.error;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('$error.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      },
      builder:(context,state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    //used MediaQuety
                    height: MediaQuery.of(context).size.height/6,
                    //height: 100,
                    ),
                  Padding(
                    padding: const EdgeInsets.all(15.0) + EdgeInsets.only(top: 7),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 17, bottom: 18),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Create User',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                //fontSize: 32
                                //used screenutil
                                fontSize: 32.sp,
                                color: Colors.black,
                                fontFamily: ''),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: formstate,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [

                          TextFormField(
                            onSaved: (val) {
                              name = val;
                            },
                            validator: (String? value) {
                              if (value != null && value.length < 2) {
                                return 'please enter your Name';
                              } else if (value != null && value.length > 2)
                                return null;
                              else {
                                return 'Name can not be less than 3 letter';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'name',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width:
                                    1),
                              ),
                            ),
                          ),
                          SizedBox(
                            //used MediaQuety
                            height: MediaQuery.of(context).size.height/30,
                            //height: 20,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value != null && value.length < 2) {
                                return 'please enter your Email';
                              } else if (value != null && value.length > 2) {
                                return null;
                              }
                              else {
                                return 'Email can not be less than 3 letter';
                              }
                            },
                            onSaved: (val) {
                              email = val;
                            },
                            decoration: InputDecoration(
                              prefixIconColor: Colors.black,
                              hintText: 'email',
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width:
                                    1),
                              ),
                            ),
                          ),
                          SizedBox(
                            //used MediaQuety
                            height: MediaQuery.of(context).size.height/30,
                            //height: 20,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value != null && value.length < 2) {
                                return 'please enter your Gender';
                              } else if (value != null && value.length > 2) {
                                return null;
                              }
                              else {
                                return 'Gender can be male or female only';
                              }
                            },
                            onSaved: (val) {
                              gender = val;
                            },
                            decoration: InputDecoration(
                              prefixIconColor: Colors.black,
                              hintText: 'gender',
                              prefixIcon: Icon(Icons.transgender),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width:
                                    1),
                              ),
                            ),
                          ),
                          SizedBox(
                            //used MediaQuety
                            height: MediaQuery.of(context).size.height/30,
                            //height: 20,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value != null && value.length < 2) {
                                return 'please enter your Status';
                              } else if (value != null && value.length > 2) {
                                return null;
                              }
                              else {
                                return 'Status can be active or inactive only';
                              }
                            },
                            onSaved: (val) {
                              status = val;
                            },

                            decoration: InputDecoration(
                              prefixIconColor: Colors.black,
                              hintText: 'status',
                              prefixIcon: Icon(Icons.accessibility),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width:
                                    1),
                              ),
                            ),
                          ),
                          SizedBox(
                            //used MediaQuety
                            height: MediaQuery.of(context).size.height/30,
                            //height: 20,
                          ),
                          InkWell(
                            onTap: ()async {
                              var formadate = formstate.currentState;
                              if (formadate?.validate() != null) {
                                formadate?.save();
                                var body = {
                                  'name': name,
                                  'email': email,
                                  'gender': gender,
                                  'status': status
                                };
                                await BlocProvider.of<UserCubit>(context)
                                    .CreateUser(body);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                              //used screenutil
                              height: 60.w,
                              //height: 60,
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                    'Create',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                          SizedBox(
                            //used MediaQuety
                            height: MediaQuery.of(context).size.height/30,
                            //height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
      }
    );
  }
}