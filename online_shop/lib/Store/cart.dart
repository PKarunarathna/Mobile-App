//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_shop/Config/config.dart';
//import 'package:online_shop/Address/address.dart';
//import 'package:online_shop/Widgets/loadingWidget.dart';
//import 'package:online_shop/Models/item.dart';
//import 'package:online_shop/Counters/cartitemcounter.dart';
//import 'package:online_shop/Counters/totalMoney.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:online_shop/Store/storehome.dart';
//import 'package:provider/provider.dart';
//import '../main.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  /*void initState()
  {
    super.initState();
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed:()
        {
            if(EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList).length ==1 )
            {
              Fluttertoast.showToast(msg:"Cart is Empty");
            }
            /*else
            {
                Route route=MaterialPageRoute(builder: (c)=>)
            }*/
        },
        label:Text("Check Out"),
        backgroundColor: Colors.limeAccent,
      ),
      appBar: AppBar(),
        body:CustomScrollView(

        
      ),
    );
  }
}
