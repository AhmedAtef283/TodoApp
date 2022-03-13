import 'package:first_app/modules/Cubit/TodoCubit.dart';
import 'package:flutter/material.dart';



Widget defaultFormField(
    {
  @required TextEditingController controller,
  @required TextInputType type,
  @required Function OnSubmit,
  Function OnTap,

  @required validate,
  @required IconData prefix,
  IconData suffix,
  bool ispaswoord = false,
  @required String label ,
  IconData prefixicon ,

})=> TextFormField(
controller: controller,

onFieldSubmitted: (String value){
print(value);
},
keyboardType: type,
validator: (value){
  if (value.isEmpty){

   return 'this field must not be empty';

  }
  return null ;
},
  decoration: InputDecoration(label:Text(label), prefixIcon:Icon(prefixicon),

  ),

);


Widget defaultTaskBuild(Map Tasks , context) => Dismissible(
  key: Key(Tasks["id"].toString()),
  child:Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 35.0,
          child: Text('${Tasks['time']}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        SizedBox(width: 10.0),

        Expanded(

          child:   Column(mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.start,



              children: [



                Text(



                  '${Tasks['title']}',



                  style: TextStyle(fontWeight: FontWeight.bold),



                ),



                Text(



                  '${Tasks['date']}',



                  style: TextStyle(color: Colors.blueGrey),



                ),



              ]),

        ),

        SizedBox(width: 1.0),

        Row(

          children: [

            IconButton( icon: Icon(Icons.check_box_outlined),

                color: Colors.green,

                onPressed: (){

                  TodoCubit.get(context).TodoUpdateStatus(id: Tasks["id"] , status: "done");

                }

            ),

            SizedBox(width: 10.0),

            IconButton( icon: Icon(Icons.archive),

                color: Colors.grey,

                onPressed: (){

                  TodoCubit.get(context).TodoUpdateStatus(id: Tasks["id"] , status: "archieved");

                }

            ),





          ],

        )





      ],

    ),

  ),
  onDismissed: (direction) {
    TodoCubit.get(context).TodoDelete(id: Tasks["id"],) ;
  },


);


