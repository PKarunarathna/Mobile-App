import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'package:online_shop/Authentication/login.dart';
//import 'package:online_shop/Config/config.dart';


class AuthenticScreen extends  StatefulWidget{
  @override 
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen>
{
   @override 
   Widget build(BuildContext context)
   {
     return DefaultTabController(
     length:2, 
     child:Scaffold(
       appBar: AppBar(
         flexibleSpace: Container(
           decoration:new BoxDecoration(
             gradient: new LinearGradient(
              colors:[Colors.green,Colors.grey],
              begin: const FractionalOffset(0.0,0.0),
              end:const FractionalOffset(1.0,0.0),
              stops:[0.0,1.0],
              tileMode: TileMode.clamp,
             ),
           ),
          ),
          title: Text(
            "online-shop",
            style:TextStyle(fontSize:55.0,color:Colors.white,fontFamily:"") ,
             ),
            centerTitle:true,
            bottom: TabBar(
              tabs: [
                 Tab(
                   icon: Icon(Icons.lock, color: Colors.white,),
                   text:"Login",
                 ),
                  Tab(
                   icon: Icon(Icons.perm_contact_calendar,color: Colors.white,),
                   text:"Register",
                 ),
              ],
              indicatorColor: Colors.white,
              indicatorWeight: 5.0,
            ),
       ),
       body: Container(
          decoration: BoxDecoration(
              gradient: new LinearGradient(
              colors:[Colors.green,Colors.grey],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
             ),
          ),
          child: TabBarView(
              children:[
                Login(), 
                Register(),
              ],
          ),
       ),
       ),
      ); 
    }
}