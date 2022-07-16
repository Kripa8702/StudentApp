import 'package:flutter/material.dart';
import 'package:student/studentAPI.dart';

import '../studentModel.dart';
class DeleteStudentAlertDialog extends StatefulWidget {
 int? id;
 DeleteStudentAlertDialog({Key? key, required this.id}) : super(key: key);

  @override
  _DeleteStudentAlertDialogState createState() => _DeleteStudentAlertDialogState();
}

class _DeleteStudentAlertDialogState extends State<DeleteStudentAlertDialog> {
  StudentApi studentApi = new StudentApi();
  bool loading = true;
  var status;

  @override
  void initState() {
    postData();
    super.initState();
  }
  void postData() async{
    var state = await studentApi.deleteStudent(widget.id);
    if(state != null){
      setState(() {
        loading = false;
        status = state;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: [
          loading?
          CircularProgressIndicator()
              :
          (status==200||status==500)?
          (status==200)?
          Container(
            child: Text('DONE'),
          ) :
          Container(
            child: Text('Student ID doesn\'t exist !'),
          ) :
          Container(
            child: Text('Error!'),
          )
        ],
      ),

    );
  }
}
