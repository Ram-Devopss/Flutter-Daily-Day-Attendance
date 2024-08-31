import 'package:Attendance/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class hello extends StatefulWidget {
  final String fname;
  final String fdept;
  const hello({super.key,required this.fname,required this.fdept});

  @override
  State<hello> createState() => _helloState();
}

class _helloState extends State<hello> {
  @override
  bool isinvaliduser = false;

  TextEditingController student_name = TextEditingController();
  TextEditingController student_number = TextEditingController();
  TextEditingController student_email = TextEditingController();
  TextEditingController student_roll = TextEditingController();
  TextEditingController student_section = TextEditingController();
  TextEditingController student_year = TextEditingController();

  Widget build(BuildContext context) {
    double screenheight = MediaQuery
        .of(context)
        .size
        .height;
    double screenwidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(title: Text(widget.fname + widget.fdept)),
        body: Container(
            height: screenheight,
            width: screenwidth,

            //color: Colors.white,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/std.gif'),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high
              ),
            ),
            child: Center(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: student_name,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: "Enter Student Name",

                                labelStyle: MaterialStateTextStyle.resolveWith(
                                      (Set<MaterialState> states) {
                                    final Color color = states.contains(
                                        MaterialState.error)
                                        ? Theme
                                        .of(context)
                                        .colorScheme
                                        .error
                                        : Colors.white;
                                    return TextStyle(
                                        color: color, letterSpacing: 1.3);
                                  },
                                ),
                                errorText: isinvaliduser
                                    ? 'Write Properly'
                                    : null,
                                errorStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.white.withOpacity(0.5),
                                filled: true,
                                prefixIcon: Icon(Icons.person)),
                          ),
                          SizedBox(
                            height: 20,
                          ), TextField(
                            controller: student_number,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Enter Student Number",

                                labelStyle: MaterialStateTextStyle.resolveWith(
                                      (Set<MaterialState> states) {
                                    final Color color = states.contains(
                                        MaterialState.error)
                                        ? Theme
                                        .of(context)
                                        .colorScheme
                                        .error
                                        : Colors.white;
                                    return TextStyle(
                                        color: color, letterSpacing: 1.3);
                                  },
                                ),
                                errorText: isinvaliduser
                                    ? 'Numbers Invalids'
                                    : null,
                                errorStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.white.withOpacity(0.5),
                                filled: true,
                                prefixIcon: Icon(Icons.person)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: student_email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Enter Student Email-Id",

                                labelStyle: MaterialStateTextStyle.resolveWith(
                                      (Set<MaterialState> states) {
                                    final Color color = states.contains(
                                        MaterialState.error)
                                        ? Theme
                                        .of(context)
                                        .colorScheme
                                        .error
                                        : Colors.white;
                                    return TextStyle(
                                        color: color, letterSpacing: 1.3);
                                  },
                                ),
                                errorText: isinvaliduser
                                    ? 'Invalid Email-Id'
                                    : null,
                                errorStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.white.withOpacity(0.5),
                                filled: true,
                                prefixIcon: Icon(Icons.person)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: student_roll,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Enter Student Roll-No",

                                labelStyle: MaterialStateTextStyle.resolveWith(
                                      (Set<MaterialState> states) {
                                    final Color color = states.contains(
                                        MaterialState.error)
                                        ? Theme
                                        .of(context)
                                        .colorScheme
                                        .error
                                        : Colors.white;
                                    return TextStyle(
                                        color: color, letterSpacing: 1.3);
                                  },
                                ),
                                errorText: isinvaliduser
                                    ? 'Invalid Roll-Numbers'
                                    : null,
                                errorStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.white.withOpacity(0.5),
                                filled: true,
                                prefixIcon: Icon(Icons.person)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: student_section,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: "Enter Student Section",

                                labelStyle: MaterialStateTextStyle.resolveWith(
                                      (Set<MaterialState> states) {
                                    final Color color = states.contains(
                                        MaterialState.error)
                                        ? Theme
                                        .of(context)
                                        .colorScheme
                                        .error
                                        : Colors.white;
                                    return TextStyle(
                                        color: color, letterSpacing: 1.3);
                                  },
                                ),
                                errorText: isinvaliduser
                                    ? 'Invalid Sections'
                                    : null,
                                errorStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.white.withOpacity(0.5),
                                filled: true,
                                prefixIcon: Icon(Icons.person)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: student_year,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Enter Student Years",

                                labelStyle: MaterialStateTextStyle.resolveWith(
                                      (Set<MaterialState> states) {
                                    final Color color = states.contains(
                                        MaterialState.error)
                                        ? Theme
                                        .of(context)
                                        .colorScheme
                                        .error
                                        : Colors.white;
                                    return TextStyle(
                                        color: color, letterSpacing: 1.3);
                                  },
                                ),
                                errorText: isinvaliduser
                                    ? 'Put Proper Year'
                                    : null,
                                errorStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none),
                                fillColor: Colors.white.withOpacity(0.5),
                                filled: true,
                                prefixIcon: Icon(Icons.person)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                              child: ElevatedButton(
                                onPressed: _submitForm,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Text('Submit'),
                              )),
                        ])


                )
            ))
    );
  }

  void _submitForm() async {
    var delivery = FirebaseFirestore.instance.collection('staffs').doc(
        'Departments').collection(widget.fdept).doc(widget.fname).collection(
        'students');
    await delivery.doc(student_roll.text.trim().toLowerCase()).set({
      'Name': student_name.text.trim().toLowerCase(),
      'Email': student_email.text.trim().toLowerCase(),
      'Mobile Number': student_number.text.trim().toLowerCase(),
      'Roll Number ': student_roll.text.trim().toLowerCase(),
      'Section': student_section.text.trim().toLowerCase(),
      'Year': student_year.text.trim().toLowerCase(),
    });


    print('Student Details:');
    print('Name: ${student_name.text}');
    print('Email-Id${student_email.text}');
    print('Mobile Number${student_number.text}');
    print('Section: ${student_section.text}');
    print('Roll Number: ${student_roll.text}');
    print('Year: ${student_year.text}');
    print("xxxxxxx" * 5 + " Stored Completed");
  }

}
/*

class StudentDetails {
  final String name;
  final String department;
  final String rollNumber;
  final String section;
  final String yearOfStudy;
  final String email;
  final String number;


  StudentDetails({
    required this.name,
    required this.department,
    required this.rollNumber,
    required this.section,
    required this.yearOfStudy,
    required this.email,
    required this.number,

  });
}

void addStudentDetails(String department, StudentDetails student) async {
 /* CollectionReference departmentCollection =

  FirebaseFirestore.instance.collection('staffs').doc('Departments').collection(student.department);
  await departmentCollection.doc(student.rollNumber).set({
    'Name': student.name,
    'Email -Id':student.email,
    'Mobile':student.number,
    'Roll Number': student.rollNumber,
    'Section': student.section,
    'Year Of Study': student.yearOfStudy,
  });*/

  CollectionReference departmentCollection =



  FirebaseFirestore.instance.collection('staffs').doc('Departments').collection('${fdept}');
  await departmentCollection.doc('${fuser}').collection('students').doc(student.rollNumber).set({
    'Name': student.name,
    'Email -Id':student.email,
    'Mobile':student.number,
    'Roll Number': student.rollNumber,
    'Section': student.section,
    'Year Of Study': student.yearOfStudy,
  });
}


//var a = new sign().facultiesDetails();

class hello extends StatelessWidget {
  final String fname;
  final String fdpet;
hello({super.key,required this.fname,required this.fdpet});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Student Details App',
      theme: ThemeData(primarySwatch: Colors.red), // Set the theme color to red
      debugShowCheckedModeBanner: false,
      home: StudentForm(),

    );
  }
}

class StudentForm extends StatefulWidget {
  @override
  StudentFormState createState() => StudentFormState();
}

class StudentFormState extends State<StudentForm> {
  final formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String?number;
  String? department;
  String? rollNumber;
  String? section;
  String? yearOfStudy;

  List<String> departments = ['Bca', 'Bcs.COM', 'Viscom'];
  List<String> sections = ['A', 'B', 'C'];
  List<String> years = ['1st Year', '2nd Year', '3rd Year'];
  late name = fname;

  void _submitForm() async{

    if (formKey.currentState!.validate()){
      formKey.currentState!.save();
      StudentDetails studentDetails = StudentDetails(
        name: name!,
        number:number!,
        email:email!,
        department: department!,
        rollNumber: rollNumber!,
        section: section!,
        yearOfStudy: yearOfStudy!,
        username:
        udepart: udepart!,
      );

      print('Student Details:');
      print('Name: ${studentDetails.name}');
      print('Email-Id${studentDetails.email}');
      print('Mobile Number${studentDetails.number}');
      print('Department: ${studentDetails.department}');
      print('Roll Number: ${studentDetails.rollNumber}');
      print('Section: ${studentDetails.section}');
      print('Year of Study: ${studentDetails.yearOfStudy}');
      print('Username: ${studentDetails.username}');
      print('Udepart: ${studentDetails.udepart}');
      if(studentDetails.name.isNotEmpty)
      {
        addStudentDetails(studentDetails.department, studentDetails);

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
      }



    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("     Students Registration",textAlign: TextAlign.center,style:TextStyle(color: Colors.white60,fontSize: 30),),backgroundColor: Colors.black,),
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
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 80),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(


                      labelText: 'Enter Student Name',
                      labelStyle: MaterialStateTextStyle.resolveWith(
                            (Set<MaterialState> states) {
                          final Color color = states.contains(MaterialState.error)
                              ? Theme.of(context).colorScheme.error
                              : Colors.white;
                          return TextStyle(color: color, letterSpacing: 1.3);
                        },
                      ),
                      hintText: "Student Name",

                      errorStyle: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 255, 0, 0),
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor: Colors.black26.withOpacity(0.5),
                      filled: true,
                      prefixIcon: Icon(Icons.person,color: Colors.blue,)),
                onSaved: (value) => name = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(


                    labelText: 'Enter Student Email-Id',
                    labelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.white;
                        return TextStyle(color: color, letterSpacing: 1.3);
                      },
                    ),
                    hintText: "Email-Id",

                    errorStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 255, 0, 0),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.black26.withOpacity(0.5),
                    filled: true,
                    prefixIcon: Icon(Icons.email,color: Colors.blue,)),
                onSaved: (value) => email = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid Email-Id';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(


                    labelText: 'Enter Student Number',
                    labelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.white;
                        return TextStyle(color: color, letterSpacing: 1.3);
                      },
                    ),
                    hintText: "Mobile Number",

                    errorStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 255, 0, 0),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.black26.withOpacity(0.5),
                    filled: true,
                    prefixIcon: Icon(Icons.phone,color: Colors.blue,)),
                onSaved: (value) => number = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid Number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(


                    labelText: 'Enter Student Department',
                    labelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.white;
                        return TextStyle(color: color, letterSpacing: 1.3);
                      },
                    ),
                    hintText: "Department",
                    errorStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 255, 0, 0),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.red.withOpacity(0.5),
                    filled: true,
                    prefixIcon: Icon(Icons.star,color: Colors.yellow,)),
                value: department,
                onChanged: (value) => department = value!,
                items: departments.map((dept) {
                  return DropdownMenuItem<String>(
                    value: dept,
                    child: Text(dept),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(


                    labelText: 'Enter Student Roll-No',
                    labelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.white;
                        return TextStyle(color: color, letterSpacing: 1.3);
                      },
                    ),
                    hintText: "Roll-No",

                    errorStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 255, 0, 0),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.red.withOpacity(0.5),
                    filled: true,
                    prefixIcon: Icon(Icons.format_list_numbered,color: Colors.yellow,)),
                onSaved: (value) => rollNumber = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid roll number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(


                    labelText: 'Select Student Section',
                    labelStyle: MaterialStateTextStyle.resolveWith(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.error)
                            ? Theme.of(context).colorScheme.error
                            : Colors.white;
                        return TextStyle(color: color, letterSpacing: 1.3);
                      },
                    ),
                    hintText: "Section",
                    errorStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 255, 0, 0),
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.blue.withOpacity(0.5),
                    filled: true,
                    prefixIcon: Icon(Icons.category_outlined,color: Colors.black,)),
                value: section,
                onChanged: (value) => section = value!,
                items: sections.map((sec) {
                  return DropdownMenuItem<String>(
                    value: sec,
                    child: Text(sec),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(

                    hintText: "YearOfStudies",
                    labelText: 'Select Student YearOfStudies',
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
                    fillColor: Colors.blue.withOpacity(0.5),
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_month_sharp,color: Colors.white60,)),
                value: yearOfStudy,
                onChanged: (value) => yearOfStudy = value!,
                items: years.map((year) {
                  return DropdownMenuItem<String>(
                    value: year,
                    child: Text(year),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
          )
        ),
      ),
    );
  }
}



/*
 onSaved: (value) => name = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },

*/
*/


// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
//
//
// class StudentDetails {
//   final String name;
//   final String department;
//   final String rollNumber;
//   final String section;
//   final String yearOfStudy;
//   final String email;
//   final String number;
//
//   StudentDetails({
//     required this.name,
//     required this.department,
//     required this.rollNumber,
//     required this.section,
//     required this.yearOfStudy,
//     required this.email,
//     required this.number
//   });
// }
//
// void addStudentDetails(String department, StudentDetails student) async {
//   CollectionReference departmentCollection =
//
//   FirebaseFirestore.instance.collection('students').doc('department').collection(student.department);
//   await departmentCollection.doc(student.rollNumber).set({
//     'Name': student.name,
//     'Email -Id':student.email,
//     'Mobile':student.number,
//     'Roll Number': student.rollNumber,
//     'Section': student.section,
//     'Year Of Study': student.yearOfStudy,
//   });
// }
//
//
//
// class hello extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       title: 'Student Details App',
//       theme: ThemeData(primarySwatch: Colors.red), // Set the theme color to red
//       debugShowCheckedModeBanner: false,
//       home: StudentForm(),
//
//     );
//   }
// }
//
// class StudentForm extends StatefulWidget {
//   @override
//   StudentFormState createState() => StudentFormState();
// }
//
// class StudentFormState extends State<StudentForm> {
//   final formKey = GlobalKey<FormState>();
//   String? name;
//   String? email;
//   String?number;
//   String? department;
//   String? rollNumber;
//   String? section;
//   String? yearOfStudy;
//
//   List<String> departments = ['Bca', 'Bcs.COM', 'Viscom'];
//   List<String> sections = ['A', 'B', 'C'];
//   List<String> years = ['1st Year', '2nd Year', '3rd Year'];
//
//   void _submitForm() async{
//     if (formKey.currentState!.validate()){
//       formKey.currentState!.save();
//       StudentDetails studentDetails = StudentDetails(
//         name: name!,
//         number:number!,
//         email:email!,
//         department: department!,
//         rollNumber: rollNumber!,
//         section: section!,
//         yearOfStudy: yearOfStudy!,
//       );
//
//       print('Student Details:');
//       print('Name: ${studentDetails.name}');
//       print('Email-Id${studentDetails.email}');
//       print('Mobile Number${studentDetails.number}');
//       print('Department: ${studentDetails.department}');
//       print('Roll Number: ${studentDetails.rollNumber}');
//       print('Section: ${studentDetails.section}');
//       print('Year of Study: ${studentDetails.yearOfStudy}');
//
//       if(studentDetails.name.isNotEmpty)
//       {
//         addStudentDetails(studentDetails.department, studentDetails);
//
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: const Text(
//               "Submitted..\u200d✍",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 17,
//                   //wordSpacing: 3,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'sanserif'),
//               textAlign: TextAlign.left,
//             ), duration: Duration(seconds: 2), backgroundColor: Colors.transparent,));
//       }
//
//
//
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("     Students Registration",textAlign: TextAlign.center,style:TextStyle(color: Colors.white60,fontSize: 30),),backgroundColor: Colors.black,),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//
//         //color: Colors.white,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/images/std.gif'),
//               fit: BoxFit.cover,
//               filterQuality: FilterQuality.high
//           ),
//         ),
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: formKey,
//           child:SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [SizedBox(height: 80),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//
//
//                       labelText: 'Enter Student Name',
//                       labelStyle: MaterialStateTextStyle.resolveWith(
//                             (Set<MaterialState> states) {
//                           final Color color = states.contains(MaterialState.error)
//                               ? Theme.of(context).colorScheme.error
//                               : Colors.white;
//                           return TextStyle(color: color, letterSpacing: 1.3);
//                         },
//                       ),
//                       hintText: "Student Name",
//
//                       errorStyle: TextStyle(
//                           fontSize: 14,
//                           color: Color.fromARGB(255, 255, 0, 0),
//                           fontWeight: FontWeight.bold),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(18),
//                           borderSide: BorderSide.none),
//                       fillColor: Colors.black26.withOpacity(0.5),
//                       filled: true,
//                       prefixIcon: Icon(Icons.person,color: Colors.blue,)),
//                 onSaved: (value) => name = value!,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a valid Name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 30),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//
//
//                     labelText: 'Enter Student Email-Id',
//                     labelStyle: MaterialStateTextStyle.resolveWith(
//                           (Set<MaterialState> states) {
//                         final Color color = states.contains(MaterialState.error)
//                             ? Theme.of(context).colorScheme.error
//                             : Colors.white;
//                         return TextStyle(color: color, letterSpacing: 1.3);
//                       },
//                     ),
//                     hintText: "Email-Id",
//
//                     errorStyle: TextStyle(
//                         fontSize: 14,
//                         color: Color.fromARGB(255, 255, 0, 0),
//                         fontWeight: FontWeight.bold),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide.none),
//                     fillColor: Colors.black26.withOpacity(0.5),
//                     filled: true,
//                     prefixIcon: Icon(Icons.email,color: Colors.blue,)),
//                 onSaved: (value) => email = value!,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a valid Email-Id';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//
//
//                     labelText: 'Enter Student Number',
//                     labelStyle: MaterialStateTextStyle.resolveWith(
//                           (Set<MaterialState> states) {
//                         final Color color = states.contains(MaterialState.error)
//                             ? Theme.of(context).colorScheme.error
//                             : Colors.white;
//                         return TextStyle(color: color, letterSpacing: 1.3);
//                       },
//                     ),
//                     hintText: "Mobile Number",
//
//                     errorStyle: TextStyle(
//                         fontSize: 14,
//                         color: Color.fromARGB(255, 255, 0, 0),
//                         fontWeight: FontWeight.bold),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide.none),
//                     fillColor: Colors.black26.withOpacity(0.5),
//                     filled: true,
//                     prefixIcon: Icon(Icons.phone,color: Colors.blue,)),
//                 onSaved: (value) => number = value!,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a valid Number';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//
//
//                     labelText: 'Enter Student Department',
//                     labelStyle: MaterialStateTextStyle.resolveWith(
//                           (Set<MaterialState> states) {
//                         final Color color = states.contains(MaterialState.error)
//                             ? Theme.of(context).colorScheme.error
//                             : Colors.white;
//                         return TextStyle(color: color, letterSpacing: 1.3);
//                       },
//                     ),
//                     hintText: "Department",
//                     errorStyle: TextStyle(
//                         fontSize: 14,
//                         color: Color.fromARGB(255, 255, 0, 0),
//                         fontWeight: FontWeight.bold),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide.none),
//                     fillColor: Colors.red.withOpacity(0.5),
//                     filled: true,
//                     prefixIcon: Icon(Icons.star,color: Colors.yellow,)),
//                 value: department,
//                 onChanged: (value) => department = value!,
//                 items: departments.map((dept) {
//                   return DropdownMenuItem<String>(
//                     value: dept,
//                     child: Text(dept),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 decoration: InputDecoration(
//
//
//                     labelText: 'Enter Student Roll-No',
//                     labelStyle: MaterialStateTextStyle.resolveWith(
//                           (Set<MaterialState> states) {
//                         final Color color = states.contains(MaterialState.error)
//                             ? Theme.of(context).colorScheme.error
//                             : Colors.white;
//                         return TextStyle(color: color, letterSpacing: 1.3);
//                       },
//                     ),
//                     hintText: "Roll-No",
//
//                     errorStyle: TextStyle(
//                         fontSize: 14,
//                         color: Color.fromARGB(255, 255, 0, 0),
//                         fontWeight: FontWeight.bold),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide.none),
//                     fillColor: Colors.red.withOpacity(0.5),
//                     filled: true,
//                     prefixIcon: Icon(Icons.format_list_numbered,color: Colors.yellow,)),
//                 onSaved: (value) => rollNumber = value!,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a valid roll number';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//
//
//                     labelText: 'Select Student Section',
//                     labelStyle: MaterialStateTextStyle.resolveWith(
//                           (Set<MaterialState> states) {
//                         final Color color = states.contains(MaterialState.error)
//                             ? Theme.of(context).colorScheme.error
//                             : Colors.white;
//                         return TextStyle(color: color, letterSpacing: 1.3);
//                       },
//                     ),
//                     hintText: "Section",
//                     errorStyle: TextStyle(
//                         fontSize: 14,
//                         color: Color.fromARGB(255, 255, 0, 0),
//                         fontWeight: FontWeight.bold),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide.none),
//                     fillColor: Colors.blue.withOpacity(0.5),
//                     filled: true,
//                     prefixIcon: Icon(Icons.category_outlined,color: Colors.black,)),
//                 value: section,
//                 onChanged: (value) => section = value!,
//                 items: sections.map((sec) {
//                   return DropdownMenuItem<String>(
//                     value: sec,
//                     child: Text(sec),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//
//                     hintText: "YearOfStudies",
//                     labelText: 'Select Student YearOfStudies',
//                     labelStyle: MaterialStateTextStyle.resolveWith(
//                           (Set<MaterialState> states) {
//                         final Color color = states.contains(MaterialState.error)
//                             ? Theme.of(context).colorScheme.error
//                             : Colors.white;
//                         return TextStyle(color: color, letterSpacing: 1.3);
//                       },
//                     ),
//
//                     errorStyle: TextStyle(
//                         fontSize: 14,
//                         color: Color.fromARGB(255, 255, 0, 0),
//                         fontWeight: FontWeight.bold),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide.none),
//                     fillColor: Colors.blue.withOpacity(0.5),
//                     filled: true,
//                     prefixIcon: Icon(Icons.calendar_month_sharp,color: Colors.white60,)),
//                 value: yearOfStudy,
//                 onChanged: (value) => yearOfStudy = value!,
//                 items: years.map((year) {
//                   return DropdownMenuItem<String>(
//                     value: year,
//                     child: Text(year),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 16),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: _submitForm,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                   ),
//                   child: const Text('Submit'),
//                 ),
//               ),
//             ],
//           ),
//           )
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
