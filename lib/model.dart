import 'package:flutter/material.dart';

class Spices {
  String name;
  String image;
  String descr;

  Spices({this.image, this.name, this.descr});

  Spices.fromJson(Map<String, dynamic> json) {
    name = json['spiceName'];
    descr = json['spiceDesc'];
    image = json['spiceImage'];

  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> spices = new Map<String,dynamic>();
    spices['spiceName']= this.name;
    spices['spiceDesc']= this.descr;
    spices['spiceImage']= this.image;



  }

}
class Immunity {
  String name;
  String imageRc;
  String recipe;
  String nutrition;
  String benefits;
  String ingredients;


  Immunity({this.imageRc, this.name, this.recipe, this.nutrition, this.benefits,this.ingredients});

  Immunity.fromJson(Map<String, dynamic> json) {
    benefits = json['recsBenefits'];
    imageRc = json['recsImage'];
    ingredients = json['recsIngredients'];
    name = json['recsName'];
    nutrition = json['recsNutrition'];
    recipe = json ['recsRecipe'];

  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> spices = new Map<String,dynamic>();
    spices['recsBenefits']= this.benefits;
    spices['recsImage']= this.imageRc;
    spices['recsIngredients']= this.ingredients;
    spices['recsName']= this.name;
    spices['recsNutrition']= this.nutrition;
    spices['recsRecipe']= this.recipe;



  }

}


//List<int> inList=[1,2,3,4];
//Design d1,d2,d3;

// List<spices> spiceslist = [
// spices(
//
// image:"https://post.healthline.com/wp-content/uploads/2020/09/health-benefits-cinnamon-fb-1200x628.jpg",
// name: "Cinnamon",
// ),
// spices(
//
// image:"https://image.shutterstock.com/image-photo/fresh-rosemary-herb-on-dark-260nw-796048429.jpg",
// name: "RoseMary"),
//   spices(
//
//       image:"https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/turmeric_2_other/1800x1200_turmeric_2_other.jpg",
//       name: "Turmaric"),
//
//   spices(
//
//       image:"https://images-na.ssl-images-amazon.com/images/I/715L43e5lBL._SL1100_.jpg",
//       name: "StarAnise"),
//
//   spices(
//
//       image:"https://5.imimg.com/data5/MH/YS/MY-27010800/red-chilli-500x500.jpg",
//       name: "Red Chillies"),
//
//
//   spices(
//
//       image:"https://allmanhall.co.uk/wp-content/uploads/2019/11/Cloves-on-white-background.jpg",
//       name: "Clove"),
//
//   spices(
//
//       image:"https://valuablekitchen.com/wp-content/uploads/2021/04/Cardamom-Substitutes.jpg",
//       name: "Cardamom"),
//
//
// ];