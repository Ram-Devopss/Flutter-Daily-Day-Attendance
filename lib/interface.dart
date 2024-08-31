import 'package:Attendance/attendance.dart';

//import 'excel_attendance.dart';
import 'package:Attendance/take_attendance.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'database.dart';
import 'student_reg.dart';

class Interface extends StatefulWidget {
  final String fname;
  final String fdept;
  final String femail;

  Interface( { super.key, required this.fname, required this.fdept, required this.femail});

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {

  @override


  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth =  MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("  Take Attendance",textAlign: TextAlign.center,style:TextStyle(color: Colors.white60),),backgroundColor: Colors.black,
      ),
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
        child: RecyclerViewPage(fname: '${widget.fname}', fdept: '${widget.fdept}', femail: '${widget.femail}'),
      ),
      drawer: Drawer(


        child: ListView(
          children: <Widget>[

            UserAccountsDrawerHeader(
              accountName: Text("${widget.fname}"),
              decoration:  BoxDecoration(
                color: Colors.black45,

              ),
              accountEmail: Text("${widget.femail}"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white12,

                radius:100,
                child: CircleAvatar(
                  radius: 30,

                  backgroundImage:
                  AssetImage('assets/images/apollo_logo.png'),

                ),
              ),
            ),
            SizedBox(height: 30,),

            ListTile(
              title: const Text(
                "Student Register",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    wordSpacing: 4,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'sanserif'),
                textAlign: TextAlign.left,
              ),
              trailing: Icon(Icons.person_sharp,color: Colors.blue,),
              onTap: ()
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => hello(fname: '${widget.fname}', fdept: '${widget.fdept}')));
              },
            ),
            SizedBox(height: 15,),
            ListTile(
              title: const Text(
                "Take Attendance",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    wordSpacing: 4,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'sanserif'),
                textAlign: TextAlign.left,
              ),
              // onTap: (){
              //   {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => Interface()));
              //   }
              // }
              // ,
              trailing: Icon(Icons.app_registration,color: Colors.red),
            ),
            SizedBox(height: 15,),
            ListTile(
                title: const Text(
                  "Attendance History",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      wordSpacing: 4,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sanserif'),
                  textAlign: TextAlign.left,
                ),
                trailing: Icon(Icons.hourglass_empty,color: Colors.pink),
                onTap: (){
                  {

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Database()));
                  }
                }

            ),
            SizedBox(height: 15,),
            ListTile(
                title: const Text(
                  "Events",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      wordSpacing: 4,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sanserif'),
                  textAlign: TextAlign.left,
                ),
                trailing: Icon(Icons.emoji_events_rounded,color: Colors.deepOrange,),
                onTap: (){
                  {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => takeattendance()));
                  }
                }

            ),
            SizedBox(height: 15,),
            ListTile(
                title: const Text(
                  "About Us",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      wordSpacing: 4,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sanserif'),
                  textAlign: TextAlign.left,
                ),
                trailing: Icon(Icons.verified_user,color: Colors.black),
                onTap: (){
                  {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => example()));
                  }
                }


            ),
          ],
        ),
      ),//this will just add the Navigation Drawer Icon
    );
  }
}




// import 'package:Attendance/attendance.dart';
// import 'package:Attendance/example.dart';
// import 'package:Attendance/take_attendance.dart';
// import 'package:flutter/material.dart';
//
// import 'database.dart';
// import 'student_reg.dart';
//
// class Interface extends StatefulWidget {
//   const Interface({super.key});
//
//   @override
//   State<Interface> createState() => _InterfaceState();
// }
//
// class _InterfaceState extends State<Interface> {
//
//   @override
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("     Take Attendance",textAlign: TextAlign.center,style:TextStyle(color: Colors.white60),),backgroundColor: Colors.black,
//       ),
//     body: Container(
//     height: double.infinity,
//     width: double.infinity,
//     color: Colors.white,
//     // decoration: BoxDecoration(
//     // image: DecorationImage(
//     // image: AssetImage('assets/images/login1.gif'),
//     // fit: BoxFit.cover,
//     // filterQuality: FilterQuality.high
//     // ),
//     // ),
//       //child: attendance(),
//     ),
//       drawer: Drawer(
//
//
//         child: ListView(
//           children: <Widget>[
//
//             UserAccountsDrawerHeader(
//               accountName: Text("Ram"),
//               decoration:  BoxDecoration(
//                 color: Colors.black45,
//
//               ),
//               accountEmail: Text("ramscrush000@gmail.com"),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.white12,
//
//                 radius:100,
//                 child: CircleAvatar(
//                   radius: 30,
//
//                   backgroundImage:
//                   AssetImage('assets/images/apollo_logo.png'),
//
//                 ),
//               ),
//             ),
//             SizedBox(height: 30,),
//
//             ListTile(
//               title: const Text(
//                 "Student Register",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     wordSpacing: 4,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'sanserif'),
//                 textAlign: TextAlign.left,
//               ),
//               trailing: Icon(Icons.person_sharp,color: Colors.blue,),
//               onTap: ()
//               {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => hello()));
//               },
//             ),
//             SizedBox(height: 15,),
//             ListTile(
//               title: const Text(
//                   "Take Attendance",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       wordSpacing: 4,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'sanserif'),
//                   textAlign: TextAlign.left,
//                 ),
//               onTap: (){
//                 {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Interface()));
//                 }
//               }
//               ,
//               trailing: Icon(Icons.app_registration,color: Colors.red),
//             ),
//             SizedBox(height: 15,),
//             ListTile(
//               title: const Text(
//                 "Attendance History",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     wordSpacing: 4,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'sanserif'),
//                 textAlign: TextAlign.left,
//               ),
//               trailing: Icon(Icons.hourglass_empty,color: Colors.pink),
//                 onTap: (){
//                   {
//
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => Database()));
//                   }
//                 }
//
//             ),
//             SizedBox(height: 15,),
//             ListTile(
//               title: const Text(
//                 "Events",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     wordSpacing: 4,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'sanserif'),
//                 textAlign: TextAlign.left,
//               ),
//               trailing: Icon(Icons.emoji_events_rounded,color: Colors.deepOrange,),
//                 onTap: (){
//                   {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => takeattendance()));
//                   }
//                 }
//
//             ),
//             SizedBox(height: 15,),
//             ListTile(
//               title: const Text(
//                 "About Us",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     wordSpacing: 4,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'sanserif'),
//                 textAlign: TextAlign.left,
//               ),
//               trailing: Icon(Icons.verified_user,color: Colors.black),
//                 onTap: (){
//                   {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => example()));
//                   }
//                 }
//
//
//             ),
//           ],
//         ),
//       ),//this will just add the Navigation Drawer Icon
//     );
//   }
// }
