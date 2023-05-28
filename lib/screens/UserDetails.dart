import 'package:crud_app/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/states.dart';
import '../modules/user.dart';
import 'Home.dart';

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails({Key? key, required this.user}) : super(key: key);

  @override
  @override

  Widget build(BuildContext context) {
    var name,email,gender,status;
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();
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
      builder: (context,state) {
        return Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formstate,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    TextFormField(
                      controller: TextEditingController(text : user.name),
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
                              width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: TextEditingController(text : user.email),
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
                      height: 20,
                    ),
                    TextFormField(
                      controller: TextEditingController(text : user.gender),
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
                      height: 20,
                    ),
                    TextFormField(
                      controller: TextEditingController(text : user.status),
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
                              width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                          print(body);
                          await UserCubit.get(context).UpdateUser(body, user.id);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        height: 60,
                        width: double.infinity,
                        child: Center(
                            child: Text(
                              'Update',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: ()async {
                        var formadate = formstate.currentState;
                        if (formadate?.validate() != null) {
                          formadate?.save();
                          await UserCubit.get(context).DeleteUser(user.id);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        height: 60,
                        width: double.infinity,
                        child: Center(
                            child: Text(
                              'Delete',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  },
    );
  }
}
