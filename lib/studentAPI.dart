import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student/studentModel.dart';

class StudentApi{
  String studentUrl = "http://10.0.2.2:8000/api/v1/student";
  
  getStudentDetails() async{
    try{
      var url = Uri.parse(studentUrl);
      http.Response response = await http.get(url) ;
      print(response.body);
      var jsonData = await jsonDecode(response.body);

      var studentList = [];

      if(response.statusCode == 200){
        for(var json in jsonData){
          StudentModel studentModel = new StudentModel();
          studentModel.id = json["id"] != 0 ? json["id"] : 0;
          studentModel.name = json["name"] != null? json["name"] : "NA";
          studentModel.dob = json["dob"] != null? json["dob"] : "NA";
          studentModel.email = json["email"] != null? json["email"] : "NA";
          studentModel.age = json["age"] != 0 ? json["age"] : 0;

          studentList.add(studentModel);
        }
        return studentList;
      }
      else
        return null;
    }
    catch(e){
      print(e);
      return null;
    }
  }

  postStudent(String? name, String? email, String? dob) async{
    try{
      Map data = {
        "name": name,
        "email": email,
        "dob": dob
      };
      print ("Data is $data");
      String body = json.encode(data);

      var url = Uri.parse(studentUrl);
      http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: body
      );

      print(response.body);
      print(response.statusCode);
      return response.statusCode;
    }
    catch(e){
      print(e);
      return null;
    }
  }

  deleteStudent(int? id) async{
    try{
      var url = Uri.parse("$studentUrl/$id");
      http.Response response = await http.delete(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      });

      print(response.body);
      print(response.statusCode);
      return response.statusCode;

    }
    catch(e){
      print(e);
      return null;
    }
  }
}