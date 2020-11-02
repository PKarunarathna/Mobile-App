import 'dart:async';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'Authentication/authentication.dart';
import 'package:online_shop/Config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Authentication/authentication.dart';
import 'Store/storehome.dart';
//import 'Store/storehome.dart';

/*void main() {
  runApp(MyApp());
}*/ 
Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  EcommerceApp.auth = FirebaseAuth.instance;
  EcommerceApp.sharedPreferences= await SharedPreferences.getInstance();
  EcommerceApp.firestore= Firestore.instance;



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'online-shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primaryColor: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override 
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override 
  void initState(){
    super.initState();

    displaySplash(); 
  }
 
  
 displaySplash()
 { 
  Timer (Duration(seconds:15), () async
  {
     // ignore: await_only_futures
     if (await EcommerceApp.auth.currentUser != null)
     {
       Route route=MaterialPageRoute(builder: (_) => StoreHome());
       Navigator.pushReplacement(context, route);
     }
     else{

        Route route=MaterialPageRoute(builder: (_) => AuthenticScreen());
       Navigator.pushReplacement(context, route);
     }
   });
 }

  @override 
  Widget build(BuildContext context)
  {
    return  Material(
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.purple,Colors.white],
            begin: const FractionalOffset(0.0,0.0),
            end:const FractionalOffset(1.0,0.0),
            stops:[0.0,1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/welcome.png"),
              SizedBox(height:50.0,),
              Text("Best online shop",
              style: TextStyle(color:Colors.black,fontSize:40),
              ),    
               ],
          ),
        ),
      ),
      );
    }

  }
  









