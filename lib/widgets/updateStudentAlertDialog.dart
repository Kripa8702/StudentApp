import 'package:flutter/material.dart';
import 'package:student/studentAPI.dart';
class UpdateStudentAlertDialog extends StatefulWidget {
  String? id;
  String? name;
  String? email;
  String? dob;

  UpdateStudentAlertDialog({Key? key, required this.id, required this.name, required this.email, required this.dob}) : super(key: key);

  @override
  _UpdateStudentAlertDialogState createState() => _UpdateStudentAlertDialogState();
}

class _UpdateStudentAlertDialogState extends State<UpdateStudentAlertDialog> {
  StudentApi studentApi = new StudentApi();
  bool loading = true;
  var status;

  @override
  void initState() {
    postData();
    super.initState();
  }
  void postData() async{
    var state = await studentApi.putStudent(
        widget.id,
        widget.name,
        widget.email,
        widget.dob);
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
          Container(
              height: MediaQuery.of(context).size.height * 0.2,
              alignment: Alignment.center,
              child: CircularProgressIndicator()
          )
              :
          (status==200||status==500)?
          (status==200)?
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            alignment: Alignment.center,
            child: Text('Updated Successfully !',
            ),
          ) :
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            alignment: Alignment.center,
            child: Text('Email Already Exists !'),
          ) :
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            alignment: Alignment.center,
            child: Text('Error!'),
          )
        ],
      ),

    );
  }
}
