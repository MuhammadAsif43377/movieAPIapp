import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:friday/apiservice.dart';
import 'package:friday/movie_description.dart';

class LayoutPractice extends StatefulWidget {
  const LayoutPractice({Key? key}) : super(key: key);

  @override
  State<LayoutPractice> createState() => _LayoutPracticeState();
}

class _LayoutPracticeState extends State<LayoutPractice> {
  Future<void> getData()async{
    await Future.delayed(Duration(seconds: 2),() => print("Thank you"),);
  }
  int pageNum = 1;

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tv Shows page number $pageNum'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (pageNum > 1) {
              setState(() {
                pageNum--;
              });
            }
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                pageNum++;
              });
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: FutureBuilder(
        future: api_service.forgetMovie(pageNum),
        builder: (context, snapshot) {
          if (ConnectionState.waiting==snapshot.connectionState) {
            return Center(child: CircularProgressIndicator());

          }
          if(snapshot.hasError){
            return Center(child:Text("There is an Error") ,);
          }
          if(snapshot.hasData){
            Map map1=jsonDecode(snapshot.data);
            List Data =map1["tv_shows"];


            return ListView.builder(
              itemCount: Data.length,
              itemBuilder: (context, index) {
                int movieId = Data[index]['id'];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDescription(movieId: movieId),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.network(
                        Data[index]['image_thumbnail_path'],

                        width: swidth*0.1,
                        height: sheight*0.2,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        Data[index]['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            'Start Date: ${Data[index]["start_date"]}',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Country',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              Text(
                                'Network',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: Text("No data available"));
        },
      ),
    );
  }
}
