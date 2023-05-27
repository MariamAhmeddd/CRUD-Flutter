import 'package:crud_app/cubit/cubit.dart';
import 'package:crud_app/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud_app/cubit/states.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(),
      child: MaterialApp(
        title: 'Flutter CRUD',
        home: Home(),
      ),
    );
  }
}

