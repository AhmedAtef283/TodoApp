import 'package:first_app/modules/Cubit/TodoCubitStates.dart';
import 'package:first_app/modules/DoneTasksScreen/DoneTaskScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../ArchievedTasks/ArchievedTaskScreen.dart';
import '../NewTasksScreen/NewTaskScreeen.dart';


class TodoCubit extends Cubit<TodoStates>{
  TodoCubit() : super(TodoInitialState());
  static TodoCubit get(context)=> BlocProvider.of(context) ;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archievedtasks = [];


  List<Widget> screens = [
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchievedTaskScreen(),
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archieved Tasks',
  ];
  int CurrentIndex = 0;
  Database database;



  void ChangeIndex (int index){
    CurrentIndex = index ;
    emit(ChangeBottomNaviBarStates());


  }

  void CreateDataBase()  {
    openDatabase('database.db', version: 1,
        onCreate: (database, version) {

          print('database created');
          database
              .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY ,title TEXT , date TEXT , time TEXT , status TEXT)')
              .then((value) {
            print('table created');
            emit(CreateDataBaseState()) ;
          }).catchError((error) {
            print('error is ${error.toString()}');
          });
        }
        , onOpen: (database) {
          getDataFromDatabase(database);
          print('database opened');
        } ).then((value) {
          database = value ;


    });
  }

   InsertToDatabase(
      {
        @required String title,
        @required String time,
        @required String date,
      }) async {
     await database.transaction((txn) async {
      database.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time" , "New")');
    }).then((value) {
      getDataFromDatabase(database);
     emit(GetDataFromDataBaseState());


      print('data inserted successfully');
    }).catchError((error) {
      print('error is ${error} when adding items');
    }).then((value) {

     });
  }

 void getDataFromDatabase(database)  {

     database.rawQuery('SELECT * FROM tasks').then((value) {

       value.forEach((element) {


         if(element['status'] =="New")
         {
           newtasks.add(element);
         }
         else  if(element['status'] =='done')
         {
           donetasks.add (element);
         }
         else {
           archievedtasks.add(element);
         }
       });
       emit(GetDataFromDataBaseState()) ;
     });
  }


void TodoUpdateStatus ({
  @required int id ,
  @required String status
})
{
  database.rawUpdate(
     'UPDATE tasks SET status = ? WHERE id = ?',
     ['$status', id]).then((value) {
       emit(UpdateDataBaseState());
  });
}

  void TodoDelete ({
    @required int id ,

  })
  {
        database
            .rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      emit(DeleteDataBaseState());

    });
  }

}

