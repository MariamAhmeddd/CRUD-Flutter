import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../modules/user.dart';
import 'CreateUser.dart';
import 'UserDetails.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserCubit.get(context).DisplayUsers();
    bool? loading;
    return BlocConsumer<UserCubit,dynamic>(
      listener: (context,state){
        if(state == UserListError){
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
        });
      }
      },
      builder: (context,state)  {
        loading = state is UserListLoading;
        return Scaffold(
        appBar: AppBar(
          title: Text(
            'Users'
          ),
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateUser(),
                ),
              );
            },
            child: Icon(Icons.add),
          ),
          body: loading! ? Center(
          child : CircularProgressIndicator()
          ):ListView.builder(
              itemCount: UserCubit.get(context).users.length,
              itemBuilder: (context,idx){
                User user = UserCubit.get(context).users[idx];
               {
                 return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetails(user: user),
                      ),
                    );
                  },
                );
              }}
          ),
      );
        },
    );
  }
}
