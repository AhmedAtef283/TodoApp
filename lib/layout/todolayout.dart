// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_call_super

import 'package:conditional_builder/conditional_builder.dart';
import 'package:first_app/defults/Constants.dart';
import 'package:first_app/modules/Cubit/TodoCubit.dart';
import 'package:first_app/modules/Cubit/TodoCubitStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    var scaffoldkey = GlobalKey<ScaffoldState>();
    var formkey = GlobalKey<FormState>();

    return BlocProvider(create: (context) => TodoCubit()..CreateDataBase(),
      child: BlocConsumer<TodoCubit , TodoStates>
        (builder: (BuildContext context , TodoStates states){
          
          TodoCubit cubit = TodoCubit.get(context) ; 
          return Scaffold(
            key: scaffoldkey,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (isBottomSheet) {
                  if (formkey.currentState.validate()) {

                    isBottomSheet = false;

                   cubit.InsertToDatabase(
                      title: emailcontroller.text,
                      date: datecontroller.text,
                      time: timecontroller.text,

                    ).then((value){
                      print('data sent successfully');

                    }).catchError((error){
                      print('error in inserting data');
                    });
                    Navigator.pop(context);
                    GetDataFromDataBaseState();


                  }
                } else {
                  scaffoldkey.currentState
                      .showBottomSheet((context) =>
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20.0)),
                        child: Form(
                          key: formkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: defaultFormField(
                                    controller: emailcontroller,
                                    type: TextInputType.text,
                                    prefixicon: Icons.menu,
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return 'Task Name Must not Be Empty';
                                      }
                                      return null;
                                    },
                                    prefix: Icons.title,
                                    label: 'Task Title',
                                    OnSubmit: () {}),
                              ),
                              SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: defaultFormField(
                                  controller: timecontroller,
                                  type: TextInputType.datetime,
                                  prefixicon: Icons.timer_rounded,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Time Must not Be Empty';
                                    }
                                    return null;
                                  },
                                  OnTap: () { showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  )

                                        .then((value) {
                                      print(value.format(context));
                                    });
                                  },
                                  prefix: Icons.watch_later_outlined,
                                  label: 'Task Time',
                                  OnSubmit: () {},
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: defaultFormField(
                                    controller: datecontroller,
                                    type: TextInputType.datetime,
                                    prefixicon: Icons.date_range_outlined,
                                    validate: (String value) {
                                      if (value.isEmpty) {
                                        return 'Date Must not Be Empty';
                                      }
                                      return null;
                                    },
                                    OnTap: () {
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                          DateTime.parse('2021 / 03 /28'))
                                          .then((value) {
                                        datecontroller.text =
                                            DateFormat.yMMMd().format(value);
                                      });
                                    },
                                    OnSubmit: () {},
                                    label: 'Task Date',
                                    prefix: Icons.calendar_month_outlined,
                                  )),

                            ],
                          ),
                        ),
                      ))
                      .closed
                      .then((value) {
                    isBottomSheet = false;
                  });

                  isBottomSheet = true;
                }
              },
              child: Icon(fabicon),
            ),
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.CurrentIndex],
              ),
            ),
            body: ConditionalBuilder( 
              builder:(context) => cubit.screens[cubit.CurrentIndex],
              condition:true,
              fallback:(context)=>Center(
                  child: CircularProgressIndicator()),),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.CurrentIndex,
              onTap: (index) {

                   cubit.ChangeIndex(index) ;

              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Task'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archieved'),
              ],
            ),
          );
      } ,
        listener: (BuildContext context , TodoStates states){

        },

      ),
    );
  }
}



  var emailcontroller = TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  Database database;
  bool isBottomSheet = false;
  IconData fabicon = Icons.edit;








