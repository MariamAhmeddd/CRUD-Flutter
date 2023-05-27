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
    final userCubit = BlocProvider.of<UserCubit>(context);
    userCubit.DisplayUsers();
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
      }else if(state == UserListLoaded){
          loading = !loading!;
        }
      },
      builder: (context,state)  {
        loading = state is UserListLoading;
        //print(userCubit.users.length);
        //userCubit.CreateUser({"name":"ahmed", "gender":"male", "email":"ahmed@15ce.com", "status":"active"});
        return Scaffold(
        appBar: AppBar(
          title: Text(
            'Users'
          ),
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              /*
              final body = {
                "name": "Jojy Doe",
                "gender": "male",
                "email": "jojy.doe@example.com",
                "status": "active"
              };
              userCubit.UpdateUser(body);*/
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
              itemCount: userCubit.users.length,
              itemBuilder: (context,idx){
                User user = userCubit.users[idx];
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
              }
          ),
      );
        },
    );
  }
}
