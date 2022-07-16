import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/screens/studentDetails.dart';
import 'package:student/studentModel.dart';
class StudentCard extends StatelessWidget {
  final StudentModel studentModel;
  const StudentCard({Key? key , required this.studentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentDetails(studentModel: studentModel)),
        );
      },
      child: Container(
        margin:  EdgeInsets.all(height*0.01),
        child : Card(
          elevation: 6.5,
            child : Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: const Icon(
                    Icons.person_outline_sharp,
                    size: 30,
                    color: Colors.black,
                  )
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  child: Text(" ${studentModel.name}",
                      style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                  ),
                  ),
                ),
              ],
            )
        )
      ),
    );
  }
}
