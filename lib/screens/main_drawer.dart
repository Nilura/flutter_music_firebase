
import 'package:flutter/material.dart';
import 'package:music_player_app/screens/searchsong.dart';

import 'feedback.dart';


class MainDrawer extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assets/logo.jpg'),
                fit: BoxFit.cover,
              ),


            ),
            color: Theme.of(context).primaryColor,
            child: Center(
              child:Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top:30,
                      bottom:10,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(

                            image: AssetImage('assets/logo.jpg'),
                            fit:BoxFit.fill
                        )

                    ),


                  ),
                  Text('Ashen Nilura' ,style:TextStyle(fontSize: 22,color:Colors.white),
                  ),
                  Text('ashennilura@gmail.com' ,style:TextStyle(color:Colors.white),)
                ],
              ),

            ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title:Text('Search', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>CloudFirestoreSearch()));
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title:Text('Feedback', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ReachUs()));
            },
          ),




        ],
      ),
    );
  }
}