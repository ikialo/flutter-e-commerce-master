import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widgets/fetchProducts.dart';

import '../../widgets/customButton.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {


  

  @override
  Widget build(BuildContext context) {
     final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15));
    return Scaffold(
      body: SafeArea(
        child:Stack(children: [
           fetchData("users-cart-items"),
           Positioned(child: Padding(padding: EdgeInsets.only(left: 10, right: 20), child:  customButton("Purchase", (){
                          
                        },),),
          bottom: 20,
          
          )
           
        ],),
      ),
    );
  }
}
