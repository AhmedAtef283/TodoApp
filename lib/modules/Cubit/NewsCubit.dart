
import 'package:first_app/modules/BusinussScreen/BusinussScreen.dart';
import 'package:first_app/modules/ScienceScreen/ScienceScreen.dart';
import 'package:first_app/modules/SettingsScreen/SettingsScreen.dart';
import 'package:first_app/modules/SportsScreen/SportsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'NewsCubitStates.dart';


class NewsCubit extends Cubit <NewsCubitStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context)=> BlocProvider.of(context) ;
  int CurrentIndex = 0 ;


  List<BottomNavigationBarItem> BottomItem = [

    BottomNavigationBarItem(icon:Icon(Icons.business_center) ,
label:'Businuss',
) ,
    BottomNavigationBarItem(icon:Icon(Icons.science_outlined) ,
      label:'Science',
    ) ,
    BottomNavigationBarItem(icon:Icon(Icons.sports) ,
      label:'Sports',
    ) ,
    BottomNavigationBarItem(icon:Icon(Icons.settings) ,
      label:'Settings',
    ) ,

  ] ;

  List<Widget> Screens = [
    BusinussScreen(),
    ScienceScreen(),
    SportsScreen(),
    SettingsScreen(),
  ];


  void ChangeBottomNav (index){
    CurrentIndex = index ;
    emit(NewsChangeBottomNavState(),);






  }




}
