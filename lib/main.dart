import 'package:flutter/material.dart';
import 'package:student/constants/colors.dart';
import 'package:student/screens/addStudentDetailsScreen.dart';
import 'package:student/screens/deleteStudentFromList.dart';
import 'package:student/screens/studentList.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff2B56FA),
      ),
      home: const MyHomePage(title: 'Students'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: (){
                print("tapped");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentList()),
                );
              },
              child: Card(
                  elevation: 6.5,
                  child : Container(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      children: const [
                        Text('All Students',
                          style: TextStyle(
                            fontSize: 20,
                            color: darkBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: (){
                print("tapped");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddStudentDetailsScreen()),
                );
              },
              child: Card(
                  elevation: 6.5,
                  child : Container(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      children: const [
                        Text('Add Student',
                          style: TextStyle(
                            fontSize: 20,
                            color: darkBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: (){
                print("tapped");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeleteStudentFromList()),
                );
              },
              child: Card(
                  elevation: 6.5,
                  child : Container(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      children: const [
                        Text('Delete Student',
                          style: TextStyle(
                            fontSize: 20,
                            color: darkBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
        ],
      )
    );
  }
}
