import 'package:first_app/defults/dio.dart';
import 'package:first_app/modules/Cubit/NewsCubit.dart';
import 'package:first_app/modules/Cubit/NewsCubitStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit() ,
      child: BlocConsumer<NewsCubit , NewsCubitStates>(
        listener:(context , state){},
        builder:  (context , state){
          var cubit = NewsCubit.get(context) ;

        return Scaffold(

          appBar: AppBar(
            title: Text(' News App ') , actions: [
              Icon(Icons.search),
          ]),

          bottomNavigationBar:BottomNavigationBar(type: BottomNavigationBarType.fixed,
          currentIndex: cubit.CurrentIndex,
          onTap: (index){
            cubit.ChangeBottomNav(index);


          },
            items: cubit.BottomItem,

        ),
          body: cubit.Screens[cubit.CurrentIndex],
          floatingActionButton:FloatingActionButton(
            onPressed: (){

              DioHelper.GetData(url: 'https://gate.ahram.org.eg',
                  query: {
                  }
                  ).then((value) {

                    print('Data Get Successfully');
              }).catchError((error) {
                print('Data Get Failed');
              } );

            },
            child: Icon(Icons.add),
          ) ,



        );
        },

      ),
    );
  }
}


//https://gate.ahram.org.eg/News/3420959.aspx

