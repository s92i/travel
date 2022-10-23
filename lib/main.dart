import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit_logics.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/pages/detail_page.dart';
import 'package:travel/pages/navpages/main_page.dart';
import 'package:travel/pages/welcome.dart';
import 'package:travel/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      )
    );
  }
}
