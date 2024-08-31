
import 'dart:ffi';
import 'package:Attendance/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class sign extends StatefulWidget {
  @override
  State<sign> createState() => _sign();
}

class _sign extends State<sign> {



  get fToast => null;
  int? radioposition;
  //TextEditingController usernameController = TextEditingController();

  TextEditingController userController = TextEditingController();
  TextEditingController DeptController =TextEditingController();
  TextEditingController  NumController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  List<String> departments = ['Bca', 'Bcs.COM', 'Viscom'];
  bool isinvalidretypepass = false;
  bool isinvalidpass = false;
  bool isinvaliduser = false;
  bool isuserexists = false;
  bool isinvaliduserregex = false;
  bool isinvalidselection = false;
  bool _isVisible = false;
  /// Firebase Activity

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth =  MediaQuery.of(context).size.width;
    return Scaffold(

      // to hide debug banner
      appBar: AppBar(title: (Text('Sign In')),backgroundColor: Colors.black),
      body: Builder(
          builder: (context) => Center(
            child: Scaffold(
              body: Container(
                height: screenheight,
                width: screenwidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login1.gif'),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high
                  ),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // SizedBox(height: 40),
                          //_header(context),
                          SizedBox(height: 60),
                          _inputFields(context),
                          SizedBox(height: 100),

                          _loginInfo(context)
                        ]),
                  ),
                ),
              ),
            ),
          )),
    );
  }
  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  _header(context) {
    return Column(
      children: [
        Text(
          "Create Account",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _inputFields(context) {



    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: userController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: "Username",
            errorText: isinvaliduser
                ? isinvaliduserregex
                ? "Incorrect Username"
                : isuserexists
                ? "Username already taken"
                : null
                : null,
            errorStyle: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold),
            fillColor: Colors.white.withOpacity(0.5),
            filled: true,
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: DeptController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Enter Department",
            errorStyle: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold),
            fillColor: Colors.white.withOpacity(0.5),
            filled: true,
            prefixIcon: Icon(Icons.category),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
        ),SizedBox(
          height: 20,
        ),

        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Email id",
            errorStyle: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold),
            fillColor: Colors.white.withOpacity(0.5),
            filled: true,
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        TextField(
          controller: NumController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Enter Mobile Number",
            errorStyle: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold),
            fillColor: Colors.white.withOpacity(0.5),
            filled: true,
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: passController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: _isVisible ? false : true,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () => updateStatus(),
              icon:
              Icon(_isVisible ? Icons.visibility : Icons.visibility_off),),
            hintText: "Password",
            errorText: isinvalidpass ? "Incorrect Password" : null,
            errorStyle: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold),
            fillColor: Colors.white.withOpacity(0.5),
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),

        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: repassController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: _isVisible ? false : true,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () => updateStatus(),
              icon:
              Icon(_isVisible ? Icons.visibility : Icons.visibility_off),),
            hintText: "Retype Password",
            errorText: isinvalidretypepass ? 'Passwords should match' : null,
            errorStyle: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold),
            fillColor: Colors.white.withOpacity(0.5),
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
          ),

        ),

        SizedBox(
          height: 100,
        ),

        FloatingActionButton(
          shape: StadiumBorder(),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black45,
          onPressed: ()


          async{


            try {
              await _auth
                  .createUserWithEmailAndPassword(
                  email: emailController.text.trim(),
                  password: passController.text.trim());
              facultiesDetails('${userController.text.trim().toLowerCase()}','${DeptController.text.trim().toLowerCase()}',"${emailController.text.trim()}", passController.text.trim(), NumController.text.trim());

              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(
                    "Successful Sign..\u200d✌",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        //wordSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sanserif'),
                    textAlign: TextAlign.left,
                  ), duration: Duration(seconds: 2), backgroundColor: Colors.white12,));

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => loginpage()));
            }catch(e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(
                    "Something Went Wrong In Signup\u200d😥",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        //wordSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sanserif'),
                    textAlign: TextAlign.left,
                  ), duration: Duration(seconds: 2), backgroundColor: Colors.white12,));

            }


          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(fontSize: 20, fontFamily: 'bold'),
                    ),
                    Icon(Icons.how_to_reg_rounded)
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}




void facultiesDetails(String user,String Dept,String email,String Password,String Number) async {

  var name = user.toLowerCase();
  var Department = Dept.toLowerCase();
  var Email = email;
  var password = Password;
  var Num = Number;
  CollectionReference departmentCollection =



  FirebaseFirestore.instance.collection('staffs').doc('Departments').collection('$Department');
  await departmentCollection.doc('$name').set({
    'Name': name,
    'Department':Department,
    'Mobile Number': Num,
    'Email -Id':Email,
    'Password':password,
    //'Year Of Study': student.yearOfStudy,
  });
  print('Stored... Faculties Data');
  //Getvalues();
}


_loginInfo(context) {


  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Already have an account?",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => loginpage()));
          },
          child: Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ))
    ],
  );


}








// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_key_in_widget_constructors, avoid_print
//
// import 'dart:ffi';
// import 'package:Attendance/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class sign extends StatefulWidget {
//   @override
//   State<sign> createState() => _sign();
// }
//
// class _sign extends State<sign> {
//   get fToast => null;
//   int? radioposition;
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController  NumController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//   TextEditingController repassController = TextEditingController();
//   bool isinvalidretypepass = false;
//   bool isinvalidpass = false;
//   bool isinvaliduser = false;
//   bool isuserexists = false;
//   bool isinvaliduserregex = false;
//   bool isinvalidselection = false;
//   bool _isVisible = false;
//   /// Firebase Activity
//
//   final _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       // to hide debug banner
//       appBar: AppBar(title: (Text('Sign In')),backgroundColor: Colors.black),
//       body: Builder(
//           builder: (context) => Center(
//             child: Scaffold(
//               body: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/login1.gif'),
//                       fit: BoxFit.cover,
//                       filterQuality: FilterQuality.high
//                   ),
//                 ),
//                 child: Center(
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           // SizedBox(height: 40),
//                           //_header(context),
//                           SizedBox(height: 60),
//                           _inputFields(context),
//                           SizedBox(height: 100),
//
//                           _loginInfo(context)
//                         ]),
//                   ),
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
//   void updateStatus() {
//     setState(() {
//       _isVisible = !_isVisible;
//     });
//   }
//   _header(context) {
//     return Column(
//       children: [
//         Text(
//           "Create Account",
//           style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }
//
//   _inputFields(context) {
//
//
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         TextField(
//           controller: usernameController,
//           keyboardType: TextInputType.name,
//           decoration: InputDecoration(
//             hintText: "Username",
//             errorText: isinvaliduser
//                 ? isinvaliduserregex
//                 ? "Incorrect Username"
//                 : isuserexists
//                 ? "Username already taken"
//                 : null
//                 : null,
//             errorStyle: TextStyle(
//                 fontSize: 14,
//                 color: Color.fromARGB(255, 255, 0, 0),
//                 fontWeight: FontWeight.bold),
//             fillColor: Colors.white.withOpacity(0.5),
//             filled: true,
//             prefixIcon: Icon(Icons.person),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide.none),
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//
//         TextField(
//           controller: emailController,
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//             hintText: "Email id",
//             errorStyle: TextStyle(
//                 fontSize: 14,
//                 color: Color.fromARGB(255, 255, 0, 0),
//                 fontWeight: FontWeight.bold),
//             fillColor: Colors.white.withOpacity(0.5),
//             filled: true,
//             prefixIcon: Icon(Icons.email_outlined),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide.none),
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         TextField(
//           controller: passController,
//           keyboardType: TextInputType.visiblePassword,
//           obscureText: _isVisible ? false : true,
//           decoration: InputDecoration(
//             suffixIcon: IconButton(
//               onPressed: () => updateStatus(),
//               icon:
//               Icon(_isVisible ? Icons.visibility : Icons.visibility_off),),
//             hintText: "Password",
//             errorText: isinvalidpass ? "Incorrect Password" : null,
//             errorStyle: TextStyle(
//                 fontSize: 14,
//                 color: Color.fromARGB(255, 255, 0, 0),
//                 fontWeight: FontWeight.bold),
//             fillColor: Colors.white.withOpacity(0.5),
//             filled: true,
//             prefixIcon: Icon(Icons.password_outlined),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide.none),
//           ),
//
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         TextField(
//           controller: repassController,
//           keyboardType: TextInputType.visiblePassword,
//           obscureText: _isVisible ? false : true,
//           decoration: InputDecoration(
//             suffixIcon: IconButton(
//               onPressed: () => updateStatus(),
//               icon:
//               Icon(_isVisible ? Icons.visibility : Icons.visibility_off),),
//             hintText: "Retype Password",
//             errorText: isinvalidretypepass ? 'Passwords should match' : null,
//             errorStyle: TextStyle(
//                 fontSize: 14,
//                 color: Color.fromARGB(255, 255, 0, 0),
//                 fontWeight: FontWeight.bold),
//             fillColor: Colors.white.withOpacity(0.5),
//             filled: true,
//             prefixIcon: Icon(Icons.password_outlined),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide.none),
//           ),
//
//         ),
//         SizedBox(
//           height: 100,
//         ),
//
//         FloatingActionButton(
//           shape: StadiumBorder(),
//           foregroundColor: Colors.white,
//           backgroundColor: Colors.black45,
//           onPressed: () async{
//             try {
//               await _auth
//                   .createUserWithEmailAndPassword(
//                   email: emailController.text.trim(),
//                   password: passController.text.trim());
//
//
//               ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text(
//                     "Successful Sign..\u200d✌",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 17,
//                         //wordSpacing: 3,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'sanserif'),
//                     textAlign: TextAlign.left,
//                   ), duration: Duration(seconds: 2), backgroundColor: Colors.white12,));
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => loginpage()));
//             }catch(e) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text(
//                     "Something Went Wrong In Signup\u200d😥",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 17,
//                         //wordSpacing: 3,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'sanserif'),
//                     textAlign: TextAlign.left,
//                   ), duration: Duration(seconds: 2), backgroundColor: Colors.white12,));
//
//             }
//
//
//           },
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(13.0),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   //crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Text(
//                       "Register",
//                       style: TextStyle(fontSize: 20, fontFamily: 'bold'),
//                     ),
//                     Icon(Icons.how_to_reg_rounded)
//                   ]),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//
// _loginInfo(context) {
//
//   final _auth = FirebaseAuth.instance;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passController = TextEditingController();
//
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text(
//         "Already have an account?",
//         style: TextStyle(fontSize: 16, color: Colors.white),
//       ),
//       TextButton(
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => loginpage()));
//           },
//           child: Text(
//             "Login",
//             style: TextStyle(fontSize: 20),
//           ))
//     ],
//   );
// }
