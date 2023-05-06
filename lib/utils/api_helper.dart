import 'dart:convert';
import 'package:http/http.dart' as http;

class Apihelper
{

  Future<String> trainapi(String search)
  async {
    String link="https://trains.p.rapidapi.com/";
    Uri uri=Uri.parse(link);
    var json =jsonEncode({"serach:$search"});
    var result=await http.post(uri,body: json);
    print(result);
    if(result.statusCode==200)
      {
        return "success";
      }
    return "failed";
  }

}