import 'package:flutter/material.dart';
import 'package:student/studentModel.dart';
class StudentDetails extends StatelessWidget {
  final StudentModel studentModel;
  const StudentDetails({Key? key, required this.studentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
          backgroundColor: Color(0xff2B56FA),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
                margin: EdgeInsets.only(top: height * 0.03),
                alignment: Alignment.center,
                child: const Text(
                  'Student Details',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Container(
              width: width*0.8,
              height: height*0.05,
              alignment: Alignment.center,
              child: Divider(
                thickness: 5,
              ),
            ),
            Container(
              height: height*0.5,
                width: width*0.7,
                // margin: EdgeInsets.only(top: height * 0.04),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Row(
                       children: [
                         const Text(
                          'Name : ',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                         SizedBox(
                           width: width*0.1,
                         ),
                         Text(
                          '${studentModel.name}',
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                    ),
                       ],
                     ),
                     Row(
                       children: [
                         const Text(
                          'Email : ',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                         SizedBox(
                           width: width*0.1,
                         ),
                         Text(
                          '${studentModel.email}',
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                    ),
                       ],
                     ),
                     Row(
                       children: [
                         const Text(
                          'DOB : ',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                         SizedBox(
                           width: width*0.1,
                         ),
                         Text(
                          '${studentModel.dob}',
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                    ),
                       ],
                     ),
                    Row(
                       children: [
                         const Text(
                          'Age : ',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                         SizedBox(
                           width: width*0.1,
                         ),
                         Text(
                          '${studentModel.age}',
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                    ),
                       ],
                     ),

                  ],
                )),
          ],
        ),
      ),
    );
  }
}
