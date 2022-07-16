import 'package:flutter/material.dart';
import 'package:student/studentAPI.dart';
import 'package:student/widgets/studentCardForUpdate.dart';
class UpdateStudentFromList extends StatefulWidget {
  const UpdateStudentFromList({Key? key}) : super(key: key);

  @override
  State<UpdateStudentFromList> createState() => _UpdateStudentFromListState();
}

class _UpdateStudentFromListState extends State<UpdateStudentFromList> {

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
            Container(
              alignment: Alignment.center,
              height: height*0.2,
              width: width*0.5,
              child: const Text('Select the student whose details you want to update',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            Container(
              width: width*0.8,
              height: height*0.05,
              alignment: Alignment.center,
              child: Divider(
                thickness: 5,
              ),
            ),
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
                        return StudentCardForUpdate(studentModel: students[index]);
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
