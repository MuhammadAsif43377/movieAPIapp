// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:friday/apiservice.dart';
// class MobileScreen extends StatefulWidget {
//   const MobileScreen({super.key});
//
//   @override
//   State<MobileScreen> createState() => _MobileScreenState();
// }
//
// class _MobileScreenState extends State<MobileScreen> {
//   Future<void> getData() async
//   {
//     await Future.delayed(Duration(seconds: 2),()=>print('Wasif is a good student'));
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
//         child: FutureBuilder(
//           future: api_service.forgetMovie(),
//           builder: (context, snapshot) {
//             if(ConnectionState.waiting==snapshot.connectionState)
//               {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//
//             if(snapshot.hasError)
//               {
//                 return Center(
//                   child: Text('Error!'),
//                 );
//               }
//
//             if(snapshot.hasData)
//               {
//                 Map map1=jsonDecode(snapshot.data);
//                 List data=map1['tv_shows'];
//
//                 return ListView.builder(
//                   itemCount: data.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: double.infinity,
//                             height: 300,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.fill,
//                                     image: NetworkImage(
//                                         '${data[index]['image_thumbnail_path']}'
//                                     )
//                                 )
//                             ),
//
//                           ),
//                           Text('${data[index]['name']}',style: TextStyle(
//                               color: Colors.deepPurple,
//                               fontSize: 30
//                           ),),
//                           Text('${data[index]['start_date']}',style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 20
//                           ),),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('${data[index]['country']}',style: TextStyle(
//
//                                   fontSize: 20
//                               )),
//                               Text('${data[index]['network']}',style: TextStyle(
//
//                                   fontSize: 20
//                               )),
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   },);
//
//
//               }
//             return Container();
//           },
//         )
//       )
//
//
//     );
//   }
// }
