import 'package:flutter/material.dart';
import 'package:student/studentAPI.dart';
import 'package:student/widgets/studentCard.dart';
import 'package:student/studentModel.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {

  StudentApi studentApi = new StudentApi();
  var students = [];
  bool loading = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async{
    var sList = await studentApi.getStudentDetails();
    print(sList.length);
    setState(() {
      students = sList;
      loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Students'),
        ),
        body:  loading?
        const Center(
          child: CircularProgressIndicator()
        ) :
        Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView.builder(
                        physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          // padding: EdgeInsets.all(20),
                          itemCount: students.length,
                          itemBuilder: (BuildContext context , int index){
                            return StudentCard(studentModel: students[index]);
                          }

                      ),
                ],
              ),
                ),
          ],
        ),

        ),

    );
  }
}
