import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit_states.dart';
import 'package:travel/pages/detail_page.dart';
import 'package:travel/pages/home_page.dart';
import 'package:travel/pages/navpages/main_page.dart';
import 'package:travel/pages/welcome.dart';

import '../pages/welcome.dart';
import 'app_cubits.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if (state is DetailState) {
            return DetailPage();
          } if (state is WelcomeState) {
            return Welcome();
          } if (state is LoadedState) {
            return MainPage();
          } if (state is LoadingState) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
