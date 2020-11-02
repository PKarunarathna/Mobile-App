import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop/Admin/uploadItems.dart';
import 'package:online_shop/Authentication/authentication.dart';
import 'package:online_shop/Widgets/customTextField.dart';
import 'package:online_shop/DialogBox/errorDialog.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/material/snack_bar.dart';




class AdminSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    ),
    body: AdminSignInScreen(),
    );

  }
}


class AdminSignInScreen extends StatefulWidget {
   
  @override
  _AdminSignInScreenState createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen>
{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _adminIDTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {

  // ignore: unused_local_variable
    double  _screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double _screenHeight = MediaQuery.of(context).size.height;
    
    return SingleChildScrollView(
      child: Container(
         decoration:new BoxDecoration(
             gradient: new LinearGradient(
              colors:[Colors.green,Colors.grey],
              begin: const FractionalOffset(0.0,0.0),
              end:const FractionalOffset(1.0,0.0),
              stops:[0.0,1.0],
              tileMode: TileMode.clamp,
             ),
           ),
        child:Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
               alignment: Alignment.center,
              child: Image.asset(
                "images/admin.png",
                height:240.0,
                width:240.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child:Text(
                "Admin",
                style:TextStyle(color:Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                        controller: _adminIDTextEditingController ,
                        data:Icons.person,
                        hintText: "id",
                        isObsecure:false ,
                    ),
                    CustomTextField(
                        controller: _passwordTextEditingController ,
                        data:Icons.person,
                        hintText: "Password",
                        isObsecure:true ,
                    ),
                    ],
                ),
              ),
               RaisedButton(
                onPressed: () { 
                  _adminIDTextEditingController.text.isNotEmpty &&
                  _passwordTextEditingController.text.isNotEmpty
                  ? loginAdmin()
                  : showDialog(
                    context: context,
                    builder: (c)
                    {
                      return ErrorAlertDialog(message:"Please enter email & password",);
                    }
                  );
                },
                color: Colors.grey,
                child: Text("Login", style:TextStyle(color:Colors.white),),
                 ),
                  SizedBox(
                  height :50.0, 
                 ),
                  Container(
                  height: 4.0,
                  width: _screenWidth = 0.8,
                  color: Colors.red,
                 ),
                 SizedBox(
                    height :20.0,
                ),
                FlatButton.icon(
                  onPressed: () => Navigator.push(context,MaterialPageRoute(builder:(c)=>AuthenticScreen()) ),
                  icon:(Icon(Icons.nature_people, color:Colors.pink)),
                  label: Text("I'm not an Admin", style:TextStyle(color:Colors.red,fontWeight: FontWeight.bold,)),
                ),
                 SizedBox(
                    height :50.0,
                ),
          ],
        ),
      ),
    );
  }

 loginAdmin()
 {

   Firestore.instance.collection("admins").getDocuments().then((snapshot){
      snapshot.documents.forEach((element) {
     
      if(element.data["uid"] != _adminIDTextEditingController.text.trim())
      {
        
        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(SnackBar(content:Text("your id is not correct"),));
      
      }                                                                                             
      else if(element.data["password"] != _passwordTextEditingController.text.trim())
      {
      
       // ignore: deprecated_member_use
       Scaffold.of(context).showSnackBar(SnackBar(content:Text("your password is not correct"),));
      
      }
      else 
      {
         // ignore: deprecated_member_use
         Scaffold.of(context).showSnackBar(SnackBar(content:Text("Welcome, "+ element.data["name"]),));
      
       setState(() {
         _adminIDTextEditingController.text ="";
         _passwordTextEditingController.text="";
       });

        Route route = MaterialPageRoute(builder: (c) => UploadPage());
        Navigator.pushReplacement(context,route);
      
      } 
      });

   });  
 }
}
