import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
//import 'dart:html' as darthtml;  //for chrome
//import 'dart:typed_data';  // for chrome



Future main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth =  MediaQuery.of(context).size.width;
    double _sigmaX = 5; // from 0-10
    double _sigmaY = 5; // from 0-10
    double _opacity = 0.2;
    double _width = 350;
    double _height = 300;
    return MaterialApp(
      // to hide debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.comfortable,

        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.red,

        // Define the default font family.
        fontFamily: 'sanserif',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'sanserif'),
        ),
      ),

      home: Builder(
        builder: (context) => Center(

          child: Scaffold(
            body: Container(
                height: screenheight,
                width: screenwidth,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.primaries[Random().nextInt(Colors.primaries.length)],
                        Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      ],
                    )),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'assets/images/heading.jpg',
                          width: 500,
                          filterQuality: FilterQuality.high,
                          height: 90,
                          fit: BoxFit.fitWidth,
                        ),
                        const SizedBox(height: 10),
                        /* const Text(
                          "   Hi! There\u200d🖐...",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              wordSpacing: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'serif'),
                          textAlign: TextAlign.center,
                        ),*/
                        Column(

                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(

                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  //<-- SEE HERE
                                  color: Colors.white54,
                                  width: 5,
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/hello.gif',
                                filterQuality: FilterQuality.high,
                                width: 500,
                                height: 90,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            /*Image.asset(
                              'assets/images/hello.gif',
                              filterQuality: FilterQuality.high,
                              width: 500,
                              height: 90,
                              fit: BoxFit.fitWidth,

                            ),*/
                          ],
                        ),
                        SizedBox(height: 40),
                        const Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 70,
                              child: CircleAvatar(
                                radius: 200,

                                backgroundImage:
                                AssetImage('assets/images/apollo_logo.png'),

                              ),
                            )),
                        const Text(
                          "Apollo Attendance...",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              wordSpacing: 5,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'serif'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 300,
                        ),
                        Center(
                            child: ElevatedButton.icon(
                                onPressed: () {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => loginpage()));



                                },
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 65),
                                    backgroundColor: Colors.red,
                                    shadowColor: Colors.blue,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                icon: const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Get\'s Started',
                                  style: TextStyle(color: Colors.white),
                                ))),
                      ]),
                )),
          ),
        ),
      ),
    );
  }
}



















// import 'dart:math';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'login.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'dart:io';
// //import 'dart:html' as darthtml;  //for chrome
// import 'dart:typed_data';  // for chrome
//
//
//
// Future main() async {
//
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp();
//
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     double _sigmaX = 5; // from 0-10
//     double _sigmaY = 5; // from 0-10
//     double _opacity = 0.2;
//     double _width = 350;
//     double _height = 300;
//     return MaterialApp(
//       // to hide debug banner
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.comfortable,
//
//         // Define the default brightness and colors.
//         brightness: Brightness.light,
//         primaryColor: Colors.red,
//
//         // Define the default font family.
//         fontFamily: 'sanserif',
//
//         // Define the default `TextTheme`. Use this to specify the default
//         // text styling for headlines, titles, bodies of text, and more.
//         textTheme: const TextTheme(
//           displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
//           titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//           bodyMedium: TextStyle(fontSize: 14, fontFamily: 'sanserif'),
//         ),
//       ),
//
//       home: Builder(
//         builder: (context) => Center(
//           child: Scaffold(
//             body: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.primaries[Random().nextInt(Colors.primaries.length)],
//                     Colors.primaries[Random().nextInt(Colors.primaries.length)],
//                   ],
//                 )),
//                 child: SingleChildScrollView(
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Image.asset(
//                           'assets/images/heading.jpg',
//                           width: 500,
//                           filterQuality: FilterQuality.high,
//                           height: 90,
//                           fit: BoxFit.fitWidth,
//                         ),
//                         const SizedBox(height: 10),
//                         /* const Text(
//                           "   Hi! There\u200d🖐...",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 40,
//                               wordSpacing: 10,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'serif'),
//                           textAlign: TextAlign.center,
//                         ),*/
//                         Column(
//
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 120,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   //<-- SEE HERE
//                                   color: Colors.white54,
//                                   width: 5,
//                                 ),
//                               ),
//                               child: Image.asset(
//                                 'assets/images/hello.gif',
//                                 filterQuality: FilterQuality.high,
//                                 width: 500,
//                                 height: 90,
//                                 fit: BoxFit.fitWidth,
//                               ),
//                             ),
//                             /*Image.asset(
//                               'assets/images/hello.gif',
//                               filterQuality: FilterQuality.high,
//                               width: 500,
//                               height: 90,
//                               fit: BoxFit.fitWidth,
//
//                             ),*/
//                           ],
//                         ),
//                         SizedBox(height: 40),
//                         const Center(
//                             child: CircleAvatar(
//                           backgroundColor: Colors.black,
//                           radius: 70,
//                           child: CircleAvatar(
//                             radius: 200,
//
//                             backgroundImage:
//                                 AssetImage('assets/images/apollo_logo.png'),
//
//                           ),
//                         )),
//                         const Text(
//                           "Apollo Attendance...",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 40,
//                               wordSpacing: 5,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'serif'),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(
//                           height: 300,
//                         ),
//                         Center(
//                             child: ElevatedButton.icon(
//                                 onPressed: () {
//
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                       builder: (context) => loginpage()));
//
//
//
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 15, horizontal: 65),
//                                     backgroundColor: Colors.red,
//                                     shadowColor: Colors.blue,
//                                     shape: const RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(20)))),
//                                 icon: const Icon(
//                                   Icons.done,
//                                   color: Colors.white,
//                                 ),
//                                 label: const Text(
//                                   'Get\'s Started',
//                                   style: TextStyle(color: Colors.white),
//                                 ))),
//                       ]),
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }
