import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spice_diary/DescriptionPage.dart';
import 'package:spice_diary/RecipePage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
final ref = FirebaseFirestore.instance.collection("spicelist");
final recipe = FirebaseFirestore.instance.collection("immunityrecs");

//creating the connection with firebase
class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState(){
    super.initState();_controller= AnimationController(duration: Duration(seconds: 10),vsync: this)..repeat();
}
@override
void dispose(){
    super.dispose();
    _controller.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Spices Dairy", style:GoogleFonts.courgette(fontSize: 28,letterSpacing: 2),)),


      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:RotationTransition(alignment: Alignment.center,
                  turns: _controller,
                  child: VxBox(child: Image.asset("assets/images/final.jpg").objectCover(),
                  ).height(context.screenHeight*0.30).width(context.screenWidth*0.85).make(),

              ),),
            SizedBox(height: 25,),


            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Container(
                 height: 80,
                 width: 400,
                child: StreamBuilder(
                  stream: ref.snapshots(),
                  builder:(context,AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasData){
                      List<Spices> spiceslist  = snapshot.data.docs.map((e) => Spices.fromJson(e.data())).toList();


                      return  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: spiceslist.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (_)=> DetailPage(spicedata: spiceslist[index])));
                              },
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 50,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.circular(10)),

                                    child: Center(
                                        child: Text(
                                          spiceslist[index].name,
                                            style: GoogleFonts.dancingScript(fontSize: 28,fontWeight: FontWeight.bold )
                                        )),
                                  ),
                                ),
                              ),
                            );



                          });

                    }else {return CircularProgressIndicator();}
                  }
                ),
              ),
            ),
            SizedBox(height: 5,),

            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "Today's",
                  style:GoogleFonts.courgette(fontSize: 30,),
                // style: TextStyle(
                //     fontFamily: 'Quicksand',
                //     color: Colors.grey,
                //     fontSize: 14.0
                // ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
              'Immunity Booster Receipes & Ingredients',
                style:GoogleFonts.courgette(fontSize: 20,),
                // style: TextStyle(
                //     fontFamily: 'Timesroman',
                //     fontWeight: FontWeight.bold,
                //     fontSize: 30.0
                // ),
              ),
            ),
            SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child:Container(
                    height: 500,
                   // width: 400,

                    child: StreamBuilder(
                        stream: recipe.snapshots(),
                        builder:(context,AsyncSnapshot<QuerySnapshot> snapshot){
                          if (snapshot.hasData){
                            List<Immunity> immunityrecs  = snapshot.data.docs.map((e) => Immunity.fromJson(e.data())).toList();


                            return  ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: immunityrecs.length,
                                itemBuilder: (context, index) {
                                  return
                                  //   Column(
                                  //   children: [
                                  //     Padding(
                                  //       padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                  //       child: Image.network(immunityrecs[index].imageRc,),
                                  //
                                  //     ),
                                  //
                                  //   ],
                                  // );
                                    InkWell(
                                    onTap: (){
                                      Navigator.push(context,MaterialPageRoute(builder: (_)=> Recipe(recipedata: immunityrecs[index])));
                                    },
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: VxBox(

                                          child: Center(
                                              child: Image.network(
                                                immunityrecs[index].imageRc,
                                              )),
                                        ).height(context.screenHeight*0.30).width(context.screenWidth*0.90).make(),
                                      ),
                                    ),
                                  );



                                });

                          }else {return CircularProgressIndicator();}
                        }
                    ),
                  ),
                  // child: Container(
                  //   height: 275.0,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15.0),
                  //       image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/traditional-indian-drink-turmeric-milk_136595-12997.jpg"), fit: BoxFit.cover)
                  //   ),
                  //
                  //   // child: BackdropFilter(
                  //   //   //filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  //   //   child: Container(
                  //   //     decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  //   //   ),
                  //   // ),
                  // ),
                ),
                // Container(
                //     padding: EdgeInsets.only(top: 20.0, left: 30.0),
                //     child: Column(
                //       children: <Widget>[
                //         Text('BUSTER OF',
                //           style: TextStyle(
                //               fontFamily: 'Timesroman',
                //               fontSize: 25.0,
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold
                //           ),
                //         ),
                //         Text('THE DAY',
                //           style: TextStyle(
                //               fontFamily: 'Timesroman',
                //               fontSize: 25.0,
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold
                //           ),
                //         ),
                //         SizedBox(height: 10.0),
                //         Container(
                //           height: 3.0,
                //           width: 50.0,
                //           color: Colors.orange,
                //         )
                //       ],
                //     )
                // )
              ],
            )







          ],




        ),
      ),



    );

  }
}
