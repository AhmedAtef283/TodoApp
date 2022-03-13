// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CircleAvatar(
                backgroundColor: Colors.white60,
                backgroundImage: NetworkImage(
                  'https://www.pngmart.com/files/3/Man-PNG-Pic.png',
                ),
                radius: 75.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0 ,top:0.0,),
              child: Container(
                child: Text('Ahmed Atef',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue,fontSize: 15.0,
                    )),

              ),
            ),
            SizedBox(height: 15.0,),
            ListTile(
              subtitle: Text('User name',style: TextStyle( fontWeight: FontWeight.bold)),
                iconColor: Colors.blue,
                trailing: Icon(Icons.navigate_next_outlined ,size: 30.0 ,color: Colors.grey),



                title:Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Name: My name' , style: TextStyle(color: Colors.amber , fontWeight: FontWeight.bold ),),

                      ],
                    ),

                  ],
                ),

              leading: Icon(Icons.person),



            ),
            ListTile(
              subtitle: Text('User phone',style: TextStyle( fontWeight: FontWeight.bold)),
              iconColor: Colors.blue,
              trailing: Icon(Icons.navigate_next_outlined ,size: 30.0 ,color: Colors.grey),


              title:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Phone:0123456789' , style: TextStyle(color: Colors.amber , fontWeight: FontWeight.bold ),),

                    ],
                  ),

                ],
              ),

              leading: Icon(Icons.phone),



            ),
            ListTile(
              subtitle: Text('User age',style: TextStyle( fontWeight: FontWeight.bold)),
              iconColor: Colors.blue,
              trailing: Icon(Icons.navigate_next_outlined ,size: 30.0 ,color: Colors.grey),


              title:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Age: 21' , style: TextStyle(color: Colors.amber , fontWeight: FontWeight.bold ),),

                    ],
                  ),

                ],
              ),

              leading: Icon(Icons.person),



            ),
            ListTile(
              subtitle: Text('User address',style: TextStyle( fontWeight: FontWeight.bold)),
              iconColor: Colors.blue,
              trailing: Icon(Icons.navigate_next_outlined ,size: 30.0 ,color: Colors.grey),


              title:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Address: Cairo / Egypt' , style: TextStyle(color: Colors.amber , fontWeight: FontWeight.bold ),),

                    ],
                  ),

                ],
              ),

              leading: Icon(Icons.home),



            ),


          ],
        ),
      ),
    );
  }
}
