import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:friday/apiservice.dart';
class MovieDescription extends StatefulWidget {
int movieId;

MovieDescription({required this.movieId});
  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(future: api_service.forgetDescription(widget.movieId),
            builder: (context, snapshot) {
          if(ConnectionState.waiting==snapshot.connectionState)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          if(snapshot.hasError)
            {
              return Center(
                child: Text('There has some Error'),
              );
            }
          if(snapshot.hasData)
            {
              Map map1=jsonDecode(snapshot.data);
              String movieName=map1['tvShow']['name'];
              String movieDescription=map1['tvShow']['description'];
              String moviePicture=map1['tvShow']['image_thumbnail_path'];
              double movieRating=double.parse(map1['tvShow']['rating'])/2;
              String ratingCount=map1['tvShow']['rating_count'];
              String movieCountry=map1['tvShow']['country'];
              String movieDate=map1['tvShow']['start_date'];
              List moviePictures=map1['tvShow']['pictures'];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage('$moviePicture')
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    Column(
                      children: [
                        Text('$movieName',style: TextStyle(color: Colors.blue,fontSize: 18),textAlign: TextAlign.start,),
                        SizedBox(
                            width: 60,
                            child: Divider()),
                      ],
                    ),

                    SizedBox(height: 10,),
                    Text('$movieDescription',style: TextStyle(color: Colors.grey,fontSize: 14),textAlign: TextAlign.justify,),
                    SizedBox(height: 10,),
                    CarouselSlider.builder(itemCount: moviePictures.length, itemBuilder: (context, index, realIndex) {
                      return Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(10),

                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage('${moviePictures[index]}')
                            )
                        ),
                      );
                    }, options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                      // autoPlayCurve: Curves.bounceInOut,
                      // autoPlayAnimationDuration: Duration(seconds: 2)

                    )),
                    SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       RatingBar.builder(
                         initialRating: movieRating,
                         itemCount: 5,
                         allowHalfRating: true,
                         ignoreGestures: true,itemSize: 25,
                         itemBuilder: (context, index) {
                           return Icon(Icons.star,color: Colors.amber);
                         }, onRatingUpdate: (value) {

                       },),
                       Text('Rating Count: $ratingCount',style: TextStyle(color: Colors.red,fontSize: 15),),
                     ],
                   ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.flag,color: Colors.blue,),
                          SizedBox(width: 10,),
                          Text("$movieCountry"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range,color: Colors.blue,),
                          SizedBox(width: 5,),
                          Text("$movieDate"),
                        ],
                      ),
                    ],
                  )

                  ],
                ),
              );
            }
              return Container();
            },),
      ),
    );
  }
}
