import 'package:http/http.dart' as http;

class api_service{
   static Future<dynamic> forgetMovie(int num) async
  {
    var request = http.Request('GET', Uri.parse('https://www.episodate.com/api/most-popular?page=$num'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resp =(await response.stream.bytesToString());
      return resp;
    }
    else {
      print(response.reasonPhrase);
    }
  }

   static Future<dynamic> forgetDescription(int id) async
   {
     var request = http.Request('GET', Uri.parse('https://www.episodate.com/api/show-details?q=$id'));


     http.StreamedResponse response = await request.send();

     if (response.statusCode == 200) {
       var resp =(await response.stream.bytesToString());
       return resp;
     }
     else {
       print(response.reasonPhrase);
     }
   }

}