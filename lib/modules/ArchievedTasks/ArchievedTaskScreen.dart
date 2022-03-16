import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../defults/Constants.dart';
import '../Cubit/TodoCubit.dart';
import '../Cubit/TodoCubitStates.dart';

class ArchievedTaskScreen extends StatelessWidget {
  const ArchievedTaskScreen ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TodoCubit , TodoStates>(
        listener: (context, state) {} ,
        builder: (BuildContext , state ) {
          GetDataFromDataBaseState();
          var  tasks= TodoCubit.get(context).archievedtasks;
          return ConditionalBuilder(
            condition:tasks.length > 0  ,
            builder: (context) =>
                ListView.separated(
                    itemBuilder:(context, index)=>defaultTaskBuild(tasks[index] , context) ,
                    separatorBuilder: (context , index)=> Container(
                      height: 1.0,

                    ),
                    itemCount: tasks.length
                ) ,
            fallback:(context)=> Center(
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Text("No Archieved Tasks Yet , Please Add One" ,
                    style: TextStyle(fontWeight:FontWeight.bold , color: Colors.black38,fontSize: 17.0 ),  ),
                  Icon(Icons.archive , color: Colors.black38),
                ],
              ),
            ),
          );
        });
  }
}

