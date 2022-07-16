import 'package:flutter/material.dart';
import 'package:student/screens/getUpdatedDetails.dart';
import 'package:student/studentModel.dart';
class StudentCardForUpdate extends StatelessWidget {
  final StudentModel studentModel;

  const StudentCardForUpdate({Key? key,  required this.studentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GetUpdatedDetails(studentModel: studentModel,)),
        );
      },
      child: Container(
          margin:  EdgeInsets.all(height*0.01),
          child : Card(
              elevation: 6.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
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
