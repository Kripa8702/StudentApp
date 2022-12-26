import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student/studentModel.dart';
import 'package:student/widgets/updateStudentAlertDialog.dart';
class GetUpdatedDetails extends StatefulWidget {
  final StudentModel studentModel;
  const GetUpdatedDetails({Key? key, required this.studentModel}) : super(key: key);

  @override
  _GetUpdatedDetailsState createState() => _GetUpdatedDetailsState();
}

class _GetUpdatedDetailsState extends State<GetUpdatedDetails> {
  String? name;
  String? email;
  String? dob;
  String date = "2000-01-01";
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Add Student'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: EdgeInsets.only(top: height * 0.03),
                  alignment: Alignment.center,
                  child: const Text(
                    'Enter New Details',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Container(
                height: height*0.4,
                margin: EdgeInsets.fromLTRB(
                    height * 0.05, 0, height * 0.05, 0),
                child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: controller1,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                          ),
                          onFieldSubmitted: (String? inputName){
                            print(inputName);
                            setState(() {
                              name = inputName;
                            });

                          },
                        ),
                        TextFormField(
                          controller: controller2,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        TextFormField(
                          controller: controller3,
                          // enabled: false,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Date Of Birth',
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      content: Stack(
                                        children: [
                                          Container(
                                            height: height * 0.6,
                                            width: width * 0.7,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: height * 0.5,
                                                  alignment: Alignment.topCenter,
                                                  child: CupertinoDatePicker(
                                                    mode: CupertinoDatePickerMode.date,
                                                    maximumDate: DateTime.now(),
                                                    initialDateTime: DateTime(2000, 1, 1),
                                                    onDateTimeChanged: (DateTime newDate) {
                                                      print(newDate);
                                                      setState(() {
                                                        date = newDate.toString();
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.bottomCenter,
                                                  child: ElevatedButton(
                                                      onPressed: (){
                                                        Navigator.pop(context);
                                                        setState(() {
                                                          var temp = date.split(" ");
                                                          controller3.text = temp[0];
                                                        });

                                                      },
                                                      child: Text('OK')
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ));
                                }
                            );
                          },
                        ),
                      ],
                    )),
              ),
              Container(
                // margin: EdgeInsets.only(bottom: height * 0.02),
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: (){
                    print(controller1.text);
                    print(controller2.text);
                    print(controller3.text);
                    setState(() {
                      name = controller1.text.isEmpty? widget.studentModel.name : controller1.text;
                      email = controller2.text.isEmpty? widget.studentModel.email : controller2.text;
                      dob = controller3.text.isEmpty? widget.studentModel.dob : controller3.text;
                    });

                    showDialog(context: context,
                        builder: (BuildContext context){
                          return UpdateStudentAlertDialog(id: widget.studentModel.id, name: name, email: email, dob: dob);
                        });
                  },
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ));
  }
}
