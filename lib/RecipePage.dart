import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spice_diary/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Recipe extends StatefulWidget {
  final Immunity recipedata;


Recipe({ this.recipedata}) ;

@override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipedata.name, style: GoogleFonts.pacifico(),),
      ),
      body: SingleChildScrollView(


        child: Column(
          children: [

            Container(
              height: 275.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                              ),
              child: Image.network(widget.recipedata.imageRc),
              // child: BackdropFilter(
              //   //filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              //   child: Container(
              //     decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              //   ),
              // ),
            ),
            //SizedBox(height:50),
            Text(
              'Ingredients',
              style: GoogleFonts.dancingScript(fontSize: 30,fontWeight: FontWeight.bold),

            ),
            Container(
              //height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: Text(widget.recipedata.ingredients, textAlign:TextAlign.justify,
                      style: GoogleFonts.courgette(),


                    ),
                  ),

                ],
              ),
            ),
            Text(
              'Recipe',
              style: GoogleFonts.dancingScript(fontSize: 30,fontWeight: FontWeight.bold),

            ),


            Container(
              //height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: Text(widget.recipedata.recipe, textAlign:TextAlign.justify,
                      // style: GoogleFonts.pacifico(),
                      style: GoogleFonts.courgette(),


                    ),
                  ),

                ],
              ),
            ),
            Text(
              'Benefits',
              style: GoogleFonts.dancingScript(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            Container(
             // height: 150,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: Text(widget.recipedata.benefits, textAlign:TextAlign.justify,
                      style: GoogleFonts.courgette( ),


                    ),
                  ),

                ],
              ),
            ),

          ],



        ),
      ),

    );
  }
}
