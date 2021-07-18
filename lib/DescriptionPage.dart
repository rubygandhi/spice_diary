import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:spice_diary/model.dart';
import 'package:google_fonts/google_fonts.dart';


class DetailPage extends StatefulWidget {
  final Spices spicedata;

  DetailPage({ this.spicedata}) ;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.spicedata.name, style: GoogleFonts.courgette(fontSize: 18,),),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Container(
                      height: 275.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),


                         // image: DecorationImage(image: NetworkImage("https://image.freepik.com/free-photo/traditional-indian-drink-turmeric-milk_136595-12997.jpg"), fit: BoxFit.cover)
                      ),
                      child: Image.network(widget.spicedata.image),
                      // child: BackdropFilter(
                      //   //filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                      //   child: Container(
                      //     decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      //   ),
                      // ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 290,left: 10,right: 10,),
                    child: Container(
                      height: 500,
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                           Padding(
                             padding: const EdgeInsets.only(left:8.0, right: 8.0),
                             child: Text(widget.spicedata.descr, textAlign:TextAlign.justify,
                               style: GoogleFonts.courgette(fontSize: 18),


                               ),
                             ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20.0, left: 30.0),
                      child: Column(
                        children: <Widget>[
                          Text('BUSTER OF',
                            style: GoogleFonts.courgette(fontSize: 25),

                            // style: TextStyle(
                            //     fontFamily: 'Timesroman',
                            //     fontSize: 25.0,
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.bold
                            // ),
                          ),
                          Text('THE DAY',
                           style: GoogleFonts.courgette(fontSize: 18, fontWeight: FontWeight.bold),
                            // style: TextStyle(
                            //     fontFamily: 'Timesroman',
                            //     fontSize: 25.0,
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.bold
                            // ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            height: 3.0,
                            width: 50.0,
                            color: Colors.orange,
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
