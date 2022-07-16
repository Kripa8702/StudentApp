import 'package:flutter/material.dart';
import 'package:student/studentAPI.dart';
import 'package:student/studentModel.dart';
import 'package:student/widgets/deleteStudentAlertDialog.dart';
class StudentCardForDelete extends StatelessWidget {
  final StudentModel studentModel;
  const StudentCardForDelete({Key? key, required this.studentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DeleteStudentAlertDialog(id: studentModel.id)),
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
