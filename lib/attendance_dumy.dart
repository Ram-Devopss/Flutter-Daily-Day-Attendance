import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class attendance extends StatefulWidget {
  const attendance({super.key});




  @override
  State<attendance> createState() => _attendanceState();
}

class _attendanceState extends State<attendance> {
  TextEditingController studentController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isinvalidstudent = false;
  bool isinvalidemail = false;
  bool isinvalidnumber = false;


  // DropDown Values


  // Initial Selected Value

  String dropdownValue_sec = 'A Section';
  String dropdownValue_dep = 'BCA';
  // List of items in our dropdown menu


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        "              Students Details\u200d👨‍🎨",
        style: TextStyle(
          //color: Colors.white,
            fontSize: 17,
            //wordSpacing: 3,
            fontWeight: FontWeight.bold,
            fontFamily: 'sanserif'),
        textAlign: TextAlign.center,
      ), backgroundColor: Colors.white60),
      body: Container(
          height: double.infinity,
          width: double.infinity,

          //color: Colors.white,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/std.gif'),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high
            ),
          ),


            child: Padding(
              padding: const EdgeInsets.all(23.0),
child:SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    _inputField(context),

                    // SizedBox(height: 40),
                    // _authorization(context),
                    // SizedBox(height: 20,),
                    // const Text(
                    //   "As Your Wish\u200d🏵",
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 30,
                    //       wordSpacing: 4,
                    //       fontWeight: FontWeight.bold,
                    //       fontFamily: 'sanserif'),
                    //   textAlign: TextAlign.center,
                    // ),
                    // SizedBox(height: 140),
                    // _forgotPassword(context),
                    // SizedBox(height:30),
                    // _signup(context)
                  ]),
)
            ),
          )

    );
  }

  // _signup(context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Text(
  //         "Dont have an account? ",
  //         style: TextStyle(fontSize: 17 - 1, color: Colors.white),
  //       ),
  //       TextButton(
  //           onPressed: () {/*
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => SignUpScreen()));
  //        */
  //             ScaffoldMessenger.of(context).showSnackBar(
  //                 SnackBar(content: Text("Signup Page")));},
  //           child: Text(
  //             "Sign Up",
  //             style: TextStyle(fontSize: 20),
  //           ))
  //     ],
  //   );
  // }
  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: studentController,
          keyboardType: TextInputType.name,

          decoration: InputDecoration(
            labelText: 'Student Name',
              iconColor: Colors.blue,
              labelStyle: MaterialStateTextStyle.resolveWith(
                    (Set<MaterialState> states) {
                  final Color color = states.contains(MaterialState.error)
                      ? Theme.of(context).colorScheme.error
                      : Colors.white;
                  return TextStyle(color: color, letterSpacing: 1.3);
                },
              ),
              hintText: "Enter your Student",

              errorText: isinvalidstudent ? 'Incorrect Student Name' : null,
              errorStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Color.fromARGB(183, 255, 255, 255).withOpacity(0.3),
              filled: true,
              prefixIcon: Icon(Icons.person,color: Colors.blue)),
        ),

    SizedBox(height: 30),
    TextField(
    //obscureText: _isVisible ? false : true,
    controller: numberController,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      iconColor: Colors.blue,
    // suffixIcon: IconButton(
    //   onPressed: () => updateStatus(),
    //   icon:
    //   Icon(_isVisible ? Icons.visibility : Icons.visibility_off),),
    hintText: "Enter Student Number",
    errorText: isinvalidnumber ? 'Number Is NotValid' : null,
    labelText: 'Student Number',
      labelStyle: MaterialStateTextStyle.resolveWith(
            (Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.error)
              ? Theme.of(context).colorScheme.error
              : Colors.white;
          return TextStyle(color: color, letterSpacing: 1.3);
        },
      ),
    errorStyle: TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 255, 0, 0),
    fontWeight: FontWeight.bold),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide.none),
    fillColor: Color.fromARGB(183, 255, 255, 255).withOpacity(0.3),
    filled: true,
    prefixIcon: Icon(Icons.password_outlined,color: Colors.blue),
    ),

    ),
        SizedBox(height: 30),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(


            labelText: 'Email-Id',
              labelStyle: MaterialStateTextStyle.resolveWith(
                    (Set<MaterialState> states) {
                  final Color color = states.contains(MaterialState.error)
                      ? Theme.of(context).colorScheme.error
                      : Colors.white;
                  return TextStyle(color: color, letterSpacing: 1.3);
                },
              ),
              hintText: "Enter Student Email-Id",
              errorText: isinvalidemail ? 'Invalid Email' : null,
              errorStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Color.fromARGB(183, 255, 255, 255).withOpacity(0.3),
              filled: true,
              prefixIcon: Icon(Icons.person,color: Colors.blue,)),
        ),
        // SizedBox(
        //   height: 40,
        // ),
        SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

          DropdownButton<String>(
              // Step 3.
              value: dropdownValue_sec,

              // Step 4.
              items: <String>['A Section', 'B Section', 'C Section']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,

                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,

                        fontWeight: FontWeight.bold),textAlign: TextAlign.left,
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) {

                setState(() {

                  dropdownValue_sec = newValue!;
                });
              },
            ),
            DropdownButton<String>(
              // Step 3.
              value: dropdownValue_dep,
              // Step 4.
              items: <String>['BCA', 'BSC', 'B.COM']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,

                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,

                        fontWeight: FontWeight.bold),textAlign: TextAlign.right,
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) {

                setState(() {

                  dropdownValue_dep = newValue!;
                });
              },
            ),

          ],
        ),
SizedBox(height: 250),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [

            ElevatedButton.icon(
                onPressed: () {


if(studentController.text.trim()!=null)
  {
    if(numberController.text.trim()!=null)
      {
        if(emailController.text.trim()!=null)
          {
            print('Passed');
          }
      }
  }
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: const Text(
                        "Submitted..\u200d✍",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            //wordSpacing: 3,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sanserif'),
                        textAlign: TextAlign.left,
                      ), duration: Duration(seconds: 2), backgroundColor: Colors.transparent,));

                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    backgroundColor: Colors.white12,
                    shadowColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)))),
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                label: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                )),ElevatedButton.icon(
                onPressed: () {
studentController.text ='';
numberController.text = '';
emailController.text = '';

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: const Text(
                        "Write Again\u200d👆",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            //wordSpacing: 3,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sanserif'),
                        textAlign: TextAlign.left,
                      ), duration: Duration(seconds: 2), backgroundColor: Colors.white12,));

                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 33),
                    backgroundColor: Colors.white12,
                    shadowColor: Colors.blue,

                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)))),
                icon: const Icon(
                  Icons.restore_from_trash,
                  color: Colors.white,
                ),
                label: const Text(
                  'Clear',
                  style: TextStyle(color: Colors.white),
                ))
        ],)


      ],
    );
  }
  // void updateStatus() {
  //   setState(() {
  //     isinvalidstudent = !isinvalidstudent;
  //   });
  // }

}
      /*body:Center(
        child:ElevatedButton(
          child: const Text(
          "Create Excel Sheet\u200d🌟",
          style: TextStyle(
              //color: Colors.white,
              fontSize: 17,
              //wordSpacing: 3,
              fontWeight: FontWeight.bold,
              fontFamily: 'sanserif'),
          textAlign: TextAlign.left,
        ),onPressed: createExcel,)



    ),
    );
  }
}


Future<void> createExcel() async{
  final Workbook workbook = Workbook();
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  //final String path = (await getApplicationCacheDirectory()).path;
  final String path ='/storage/emulated/0/Documents/';
  DateTime today = DateTime.now();
  String dateStr = "${today.day}-${today.month}-${today.year}";
  print(dateStr);
  final String fileName = '$path$dateStr.xlsx';
  print('$path Saved');
  final File file = File(fileName);
  print("$fileName");
  await file.writeAsBytes(bytes,flush: true);

  OpenFile.open(fileName);
}*/
