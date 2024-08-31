import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'attendance.dart';
import 'package:Attendance/interface.dart';
import 'signup.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {


  // Variables



  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController departController = TextEditingController();


  bool isinvalidpass = false;
  bool isinvaliduser = false;
  bool _isVisible = false;
  final _auth = FirebaseAuth.instance;
  late String password;


  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth =  MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: (Text('Login Page')),backgroundColor: Colors.black),
      body: Container(
          height: screenheight,
          width: screenwidth,
          //color: Colors.white,
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
                    SizedBox(height: 40),
                    _inputField(context),

                    SizedBox(height: 40),
                    //_authorization(context),
                    SizedBox(height: 20,),
                    /* const Text(
                      "As Your Wish\u200d🏵",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          wordSpacing: 4,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'sanserif'),
                      textAlign: TextAlign.center,
                    ),*/
                    SizedBox(height: 140),
                    _forgotPassword(context),
                    SizedBox(height:30),
                    _signup(context)
                  ]),
            ),
          )
      ),
    );

  }


  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  _authorization(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/g_account.png',
                height: 50,
                filterQuality: FilterQuality.high,
              ),
              Image.asset(
                'assets/images/facebook.webp',
                filterQuality: FilterQuality.high,
                height: 50,

              ),
              Image.asset(
                'assets/images/twitter.png',
                filterQuality: FilterQuality.high,
                height: 50,
              )
            ]),
      ),
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: usernameController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: "Enter your Username",

              labelStyle: MaterialStateTextStyle.resolveWith(
                    (Set<MaterialState> states) {
                  final Color color = states.contains(MaterialState.error)
                      ? Theme.of(context).colorScheme.error
                      : Colors.white;
                  return TextStyle(color: color, letterSpacing: 1.3);
                },
              ),
              errorText: isinvaliduser ? 'Incorrect Username' : null,
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
        SizedBox(height: 30),
        TextField(
          controller: departController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: "Enter your Department",

              labelStyle: MaterialStateTextStyle.resolveWith(
                    (Set<MaterialState> states) {
                  final Color color = states.contains(MaterialState.error)
                      ? Theme.of(context).colorScheme.error
                      : Colors.white;
                  return TextStyle(color: color, letterSpacing: 1.3);
                },
              ),
              errorText: isinvaliduser ? 'Incorrect Username' : null,
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
        SizedBox(height: 30),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: "Enter Your Email-Id",

              labelStyle: MaterialStateTextStyle.resolveWith(
                    (Set<MaterialState> states) {
                  final Color color = states.contains(MaterialState.error)
                      ? Theme.of(context).colorScheme.error
                      : Colors.white;
                  return TextStyle(color: color, letterSpacing: 1.3);
                },
              ),
              errorText: isinvaliduser ? 'Incorrect Username' : null,
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
        SizedBox(height: 30),
        TextField(
          obscureText: _isVisible ? false : true,
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            labelStyle: MaterialStateTextStyle.resolveWith(
                  (Set<MaterialState> states) {
                final Color color = states.contains(MaterialState.error)
                    ? Theme.of(context).colorScheme.error
                    : Colors.white;
                return TextStyle(color: color, letterSpacing: 1.3);
              },
            ),
            suffixIcon: IconButton(
              onPressed: () => updateStatus(),
              icon:
              Icon(_isVisible ? Icons.visibility : Icons.visibility_off),),
            hintText: "Enter your password",
            errorText: isinvalidpass ? 'Incorrect Password' : null,
            errorStyle: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.white.withOpacity(0.5),
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
          ),

        ),
        // SizedBox(
        //   height: 40,
        // ),
        SizedBox(height: 60),
        FloatingActionButton(
          shape: StadiumBorder(),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black45,
          //onPressed: ()  async {
          onPressed: ()  async{




            try {
              await _auth
                  .signInWithEmailAndPassword(
                  email: emailController.text.trim(), password: passwordController.text.trim());



              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(
                    "Successful Login..\u200d✌",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        //wordSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sanserif'),
                    textAlign: TextAlign.left,
                  ), duration: Duration(seconds: 2), backgroundColor: Colors.white12,));
              // Navigator.of(context).push(_CONTINUE());
              //RecyclerViewPage()
              String fname = usernameController.text.trim().toLowerCase();
              String  fdept =departController.text.trim().toLowerCase();
              String femail = emailController.text.trim().toLowerCase();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Interface(fname: '$fname', fdept: '$fdept',femail: '$femail')));
              /*usernameController.text.trim().toLowerCase(),departController.text.trim().toLowerCase()))*/
            }catch(e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(
                    "Something Went Wrong In Login\u200d😥",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        //wordSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sanserif'),
                    textAlign: TextAlign.left,
                  ), duration: Duration(seconds: 2), backgroundColor: Colors.white12,));

            }

//Navigator.of(context).push(_GO_FOR_LOGIN());


          } /*{
            try {
              await _auth
                  .signInWithEmailAndPassword(
                  email: emailController.text.trim(), password: passwordController.text.trim())
                  .then((firebaseuser) async{
                if (firebaseuser != null) {
                  String? data = await CheckUser(emailid: emailController.text.trim());
                  if(data!=null && data!="None")
                  {

                    List userdetails = data.split("-");
                    String username = userdetails[0];
                    String usertype = userdetails[1];

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowProperty(
                                user: username, usertype: usertype, auth: _auth)));
                  }
                }
              }).catchError((e) {




                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error : $e")));



              });
              //autjentication
              // if (user != null) {
              //   Navigator.pushNamed(context, '/success');
              // }

            } catch(e) {
              //print('comming here');

            }

/*            CheckUser(usernamedata: user, context: context)?.then(
              (result) {
                //print("The result database password is: $result");
                if (result == "flag=InvalidUser01") {
                  setState(() {
                    isinvaliduser = true;
                    isinvalidpass = true;
                  });
                } else if (pass == result[0]) {
                  selecteduser = result[1];

                  setState(() {
                    isinvaliduser = false;
                    isinvalidpass = false;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: const Text('Successful Login')));

                  setState(() {
                    nameController.clear();
                    passwordController.clear();
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowProperty(
                              user: user, usertype: selecteduser)));
                } else {
                  setState(() {
                    isinvaliduser = false;
                    isinvalidpass = true;
                  });
                }
              },
            );
*/

          }*/,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 20, fontFamily: 'bold'),
                    ),
                    Icon(Icons.login)
                  ]),
            ),
          ),
        ),
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
        onPressed: () {
          /* Navigator.push(context,
              MaterialPageRoute(builder: (context) => RestPassword()));*/
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Forgot Password Button..")));
        },
        child: Text(
          "Forgot password?",
          style: TextStyle(fontSize: 18),
        ));
  }
}



_signup(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Dont have an account? ",
        style: TextStyle(fontSize: 17 - 1, color: Colors.white),
      ),
      TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => sign()));

          },
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 20),
          ))
    ],
  );
}
/*
Future<String?> CheckUser(
    {required emailid}) async {
  QuerySnapshot<Object?> querysnapshot =   await FirebaseFirestore.instance.collection("agentusers")
      .where('email', isEqualTo: emailid)
      .get();
  AsyncSnapshot<QuerySnapshot<Object?>> asyncquerysnapshot
  = AsyncSnapshot<QuerySnapshot<Object?>>.withData(ConnectionState.done, querysnapshot);
  var match1 = asyncquerysnapshot.data?.docs;
  String result = "None";
  if(match1==null || match1.isEmpty)
  {
    querysnapshot =   await FirebaseFirestore.instance.collection("clientusers")
        .where('email', isEqualTo: emailid)
        .get();
    asyncquerysnapshot
    = AsyncSnapshot<QuerySnapshot<Object?>>.withData(ConnectionState.done, querysnapshot);
    var match2 = asyncquerysnapshot.data?.docs;
    //print("match2 found ${match2!.first.data()}");
    var data = match2!.first.data() as Map;
    result = data["username"]+"-"+"client";
  }
  else if(match1.isNotEmpty)
  {
    //print("match1 found ${match1.first.data()}");
    var data = match1.first.data() as Map;
    result = data["username"]+"-"+"agent";
  }
  return result;


}











*/















//////////////////////////




// //import 'dart:js';
//
// import 'package:Attendance/interface.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'attendance.dart';
// import 'signup.dart';
//
// class loginpage extends StatefulWidget {
//   const loginpage({super.key});
//
//   @override
//   State<loginpage> createState() => _loginpageState();
// }
//
// class _loginpageState extends State<loginpage> {
//
//
//   // Variables
//
//
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool isinvalidpass = false;
//   bool isinvaliduser = false;
//   bool _isVisible = false;
//   final _auth = FirebaseAuth.instance;
//   late String password;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: (Text('Login Page')),backgroundColor: Colors.black),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         //color: Colors.white,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/login1.gif'),
//               fit: BoxFit.cover,
//               filterQuality: FilterQuality.high
//             ),
//           ),
//
//           child: Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     SizedBox(height: 40),
//                     _inputField(context),
//
//                     SizedBox(height: 40),
//                     //_authorization(context),
//                     SizedBox(height: 20,),
//                    /* const Text(
//                       "As Your Wish\u200d🏵",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 30,
//                           wordSpacing: 4,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'sanserif'),
//                       textAlign: TextAlign.center,
//                     ),*/
//                     SizedBox(height: 140),
//                     _forgotPassword(context),
//                     SizedBox(height:30),
//                     _signup(context)
//                   ]),
//             ),
//           )
//       ),
//     );
//
//   }
//
//   void updateStatus() {
//     setState(() {
//       _isVisible = !_isVisible;
//     });
//   }
//   _authorization(context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Image.asset(
//                 'assets/images/g_account.png',
//                 height: 50,
//                 filterQuality: FilterQuality.high,
//               ),
//               Image.asset(
//                 'assets/images/facebook.webp',
//                 filterQuality: FilterQuality.high,
//                 height: 50,
//
//               ),
//               Image.asset(
//                 'assets/images/twitter.png',
//                 filterQuality: FilterQuality.high,
//                 height: 50,
//               )
//             ]),
//       ),
//     );
//   }
//
//   _inputField(context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         TextField(
//           controller: emailController,
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//               hintText: "Enter your Username",
//
//               labelStyle: MaterialStateTextStyle.resolveWith(
//                     (Set<MaterialState> states) {
//                   final Color color = states.contains(MaterialState.error)
//                       ? Theme.of(context).colorScheme.error
//                       : Colors.white;
//                   return TextStyle(color: color, letterSpacing: 1.3);
//                 },
//               ),
//               errorText: isinvaliduser ? 'Incorrect Username' : null,
//               errorStyle: TextStyle(
//                   fontSize: 14,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(18),
//                   borderSide: BorderSide.none),
//               fillColor: Colors.white.withOpacity(0.5),
//               filled: true,
//               prefixIcon: Icon(Icons.person)),
//         ),
//         SizedBox(height: 30),
//         TextField(
//           obscureText: _isVisible ? false : true,
//           controller: passwordController,
//           keyboardType: TextInputType.visiblePassword,
//           decoration: InputDecoration(
//             labelStyle: MaterialStateTextStyle.resolveWith(
//                   (Set<MaterialState> states) {
//                 final Color color = states.contains(MaterialState.error)
//                     ? Theme.of(context).colorScheme.error
//                     : Colors.white;
//                 return TextStyle(color: color, letterSpacing: 1.3);
//               },
//             ),
//             suffixIcon: IconButton(
//               onPressed: () => updateStatus(),
//               icon:
//               Icon(_isVisible ? Icons.visibility : Icons.visibility_off),),
//             hintText: "Enter your password",
//             errorText: isinvalidpass ? 'Incorrect Password' : null,
//             errorStyle: TextStyle(
//                 fontSize: 14,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide: BorderSide.none),
//             fillColor: Colors.white.withOpacity(0.5),
//             filled: true,
//             prefixIcon: Icon(Icons.password_outlined),
//           ),
//
//         ),
//         // SizedBox(
//         //   height: 40,
//         // ),
//         SizedBox(height: 60),
//         FloatingActionButton(
//           shape: StadiumBorder(),
//           foregroundColor: Colors.white,
//           backgroundColor: Colors.black45,
//           //onPressed: ()  async {
//     onPressed: ()  async{
//
//
//       try {
//         await _auth
//             .signInWithEmailAndPassword(
//             email: emailController.text.trim(), password: passwordController.text.trim());
//
//
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text(
//               "Successful Login..\u200d✌",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 17,
//                   //wordSpacing: 3,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'sanserif'),
//               textAlign: TextAlign.left,
//             ), duration: Duration(seconds: 2), backgroundColor: Colors.white12,));
//        // Navigator.of(context).push(_CONTINUE());
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => Interface()));
//       }catch(e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text(
//               "Something Went Wrong In Login\u200d😥",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 17,
//                   //wordSpacing: 3,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'sanserif'),
//               textAlign: TextAlign.left,
//             ), duration: Duration(seconds: 2), backgroundColor: Colors.white12,));
//
//       }
//
// //Navigator.of(context).push(_GO_FOR_LOGIN());
//
//
//     } /*{
//             try {
//               await _auth
//                   .signInWithEmailAndPassword(
//                   email: emailController.text.trim(), password: passwordController.text.trim())
//                   .then((firebaseuser) async{
//                 if (firebaseuser != null) {
//                   String? data = await CheckUser(emailid: emailController.text.trim());
//                   if(data!=null && data!="None")
//                   {
//
//                     List userdetails = data.split("-");
//                     String username = userdetails[0];
//                     String usertype = userdetails[1];
//
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ShowProperty(
//                                 user: username, usertype: usertype, auth: _auth)));
//                   }
//                 }
//               }).catchError((e) {
//
//
//
//
//                 ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("Error : $e")));
//
//
//
//               });
//               //autjentication
//               // if (user != null) {
//               //   Navigator.pushNamed(context, '/success');
//               // }
//
//             } catch(e) {
//               //print('comming here');
//
//             }
//
// /*            CheckUser(usernamedata: user, context: context)?.then(
//               (result) {
//                 //print("The result database password is: $result");
//                 if (result == "flag=InvalidUser01") {
//                   setState(() {
//                     isinvaliduser = true;
//                     isinvalidpass = true;
//                   });
//                 } else if (pass == result[0]) {
//                   selecteduser = result[1];
//
//                   setState(() {
//                     isinvaliduser = false;
//                     isinvalidpass = false;
//                   });
//
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: const Text('Successful Login')));
//
//                   setState(() {
//                     nameController.clear();
//                     passwordController.clear();
//                   });
//
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ShowProperty(
//                               user: user, usertype: selecteduser)));
//                 } else {
//                   setState(() {
//                     isinvaliduser = false;
//                     isinvalidpass = true;
//                   });
//                 }
//               },
//             );
// */
//
//           }*/,
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(13.0),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   //crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Text(
//                       "Login",
//                       style: TextStyle(fontSize: 20, fontFamily: 'bold'),
//                     ),
//                     Icon(Icons.login)
//                   ]),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   _forgotPassword(context) {
//     return TextButton(
//         onPressed: () {
//          /* Navigator.push(context,
//               MaterialPageRoute(builder: (context) => RestPassword()));*/
//           ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("Forgot Password Button..")));
//         },
//         child: Text(
//           "Forgot password?",
//           style: TextStyle(fontSize: 18),
//         ));
//   }
// }
//
//
//
// _signup(context) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text(
//         "Dont have an account? ",
//         style: TextStyle(fontSize: 17 - 1, color: Colors.white),
//       ),
//       TextButton(
//           onPressed: () {
//             Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => sign()));
//
//             },
//           child: Text(
//             "Sign Up",
//             style: TextStyle(fontSize: 20),
//           ))
//     ],
//   );
// }
// /*
// Future<String?> CheckUser(
//     {required emailid}) async {
//   QuerySnapshot<Object?> querysnapshot =   await FirebaseFirestore.instance.collection("agentusers")
//       .where('email', isEqualTo: emailid)
//       .get();
//   AsyncSnapshot<QuerySnapshot<Object?>> asyncquerysnapshot
//   = AsyncSnapshot<QuerySnapshot<Object?>>.withData(ConnectionState.done, querysnapshot);
//   var match1 = asyncquerysnapshot.data?.docs;
//   String result = "None";
//   if(match1==null || match1.isEmpty)
//   {
//     querysnapshot =   await FirebaseFirestore.instance.collection("clientusers")
//         .where('email', isEqualTo: emailid)
//         .get();
//     asyncquerysnapshot
//     = AsyncSnapshot<QuerySnapshot<Object?>>.withData(ConnectionState.done, querysnapshot);
//     var match2 = asyncquerysnapshot.data?.docs;
//     //print("match2 found ${match2!.first.data()}");
//     var data = match2!.first.data() as Map;
//     result = data["username"]+"-"+"client";
//   }
//   else if(match1.isNotEmpty)
//   {
//     //print("match1 found ${match1.first.data()}");
//     var data = match1.first.data() as Map;
//     result = data["username"]+"-"+"agent";
//   }
//   return result;
//
//
// }
//
//
//
//
//
//
//
//
//
//
//
// */
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// //////////////////////////
//
//
//
//
//
//
