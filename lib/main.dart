// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support1/models/login/cubit/login_cubit.dart';
import 'package:support1/models/login/login_screen.dart';

import 'models/home/cubit/cubit.dart';
import 'models/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(
          create: (context)=>HomeCubit()..loadProducts()),
        BlocProvider(create: (context)=>LoginCubit()),
      ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
    );
  }
}
