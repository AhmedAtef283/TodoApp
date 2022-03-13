import 'package:conditional_builder/conditional_builder.dart';
import 'package:first_app/defults/Constants.dart';
import 'package:first_app/modules/Cubit/TodoCubit.dart';
import 'package:first_app/modules/Cubit/TodoCubitStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return BlocConsumer<TodoCubit , TodoStates>(
      listener: (context, state) {} ,
        builder: (BuildContext , state ) {

          var  tasks= TodoCubit.get(context).newtasks;
    return ConditionalBuilder(
        condition:tasks.length > 0  ,
        builder: (context) => ListView.separated(
            itemBuilder:(context, index)=>defaultTaskBuild(tasks[index] , context) ,
            separatorBuilder: (context , index)=> Container(
              height: 1.0,

            ),
            itemCount: tasks.length
        ) ,
    fallback:(context)=> Center(
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Text("No New Tasks Yet , Please Add One" ,
              style: TextStyle(fontWeight:FontWeight.bold ,fontSize: 20.0 ,color: Colors.black38),  ), Icon(Icons.menu , color: Colors.black38),
        ],
      ),
    ),
    );
    })



     ;
  }
}
