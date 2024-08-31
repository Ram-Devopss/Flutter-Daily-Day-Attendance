import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import'present_and_absentlists.dart';

class RecyclerViewPage extends StatefulWidget {
  final String fname;
  final String fdept;
  final String femail;

  RecyclerViewPage( { super.key, required this.fname,required this.fdept,required this.femail});

  @override
  State<RecyclerViewPage> createState() => _RecyclerViewPageState();
}

class _RecyclerViewPageState extends State<RecyclerViewPage> {
  List<String> movieList = [];

  bool conditionTrue = false;

  List<Color> cardColors =[];


  var temp=[];


  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('staffs')
      .doc('Departments')
      .collection('bca').doc('hayram').collection('students');


  var i;
  List name=[];
  final List allData =[];
  Map student={};
  final List present=[];
  final List absent = [];

  @override
  initState() {
    getnames();
    super.initState();


  }

  @override

  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth =  MediaQuery.of(context).size.width;
    return Scaffold(
      //appBar: AppBar(title: Text(widget.fname)),
      body: Container(
        height: screenheight,
        width : screenwidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListView.builder(
          itemCount: movieList.length,

          itemBuilder: (context, index) {
            return GestureDetector(

              child: Card(

                color: cardColors[index],

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),

                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // color:Colors.white60,

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 27.0, horizontal: 20.0),
                  child: Text(
                    movieList[index],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        wordSpacing: 4,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sanserif'),
                    textAlign: TextAlign.left,
                    //movieList[index]
//                   name[index],
                  ),

                ),
              ),
              onTap: () => onTap(index),
              onDoubleTap: () =>
                  onDoubleTap(index),
              onLongPress: () => onLongPress(index),

            );
          },
        ),


      ),

      bottomNavigationBar: conditionTrue ?Container(
          height: 50,
          width: double.maxFinite,

          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  enableFeedback: true,
                  tooltip:'Submit✌' ,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>pr_ab_list(present: present,absent: absent,)));
                  },
                  icon: const Icon(
                    Icons.done,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),IconButton(
                  enableFeedback: true,
                  tooltip: 'Delete Your Attendance👀',
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 35,
                  ),
                ),])): null,


    );

  }

  /**
   * Database Fetching Function
   */


  Future<List<String>> getData() async {
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('staffs')
        .doc('Departments')
        .collection('${widget.fdept}').doc('${widget.fname}').collection('students');

    print('Processing');
    //  Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    List<String> temp = [];
    // print(allData);
    // return [];

    for(var i=0;i<allData.length;i++)
    {
      student = allData.elementAt(i) as Map;

      //name[i] = student['Name'];
      temp.add(student["Name"]);


    }
    return temp;
  }


  void getnames() async
  {
    var temp = await getData();
    setState(() {
      print('CallingGetnames');
      movieList = temp;
      //movieList.forEach((element) {cardColors.add(Colors.white);print(element);});
      for(int i =0;i<movieList.length;i++)
      {
        cardColors.add(Colors.white);
        print(movieList[i]);
      }
      movieList.sort();
    });

  }


  void onTap(index) {
    setState(() {
      cardColors[index] = Color.fromARGB(255, 88, 215, 93);
      conditionTrue = true;

      final String temp =movieList[index];



      present.add(temp);

    });









    /*   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${movieList[index]} In Single Tap"),
    ));*/
  }
  void onLongPress(index) {


    setState(() {
      cardColors[index] =Color.fromARGB(255, 255, 255, 255);
      conditionTrue =false;
    });
    print('Your Final Present Is $present');
    print('Your Final Absent Is $absent');
  }

  void onDoubleTap(index) {
    setState(() {
      conditionTrue = true;
      cardColors[index] = Color.fromARGB(255, 246, 94, 83);
      final String temp =movieList[index];
      absent.add(temp);
    });
    /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${movieList[index]} In Double Tap"),
    ));*/
  }
}


/*
*  width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 9,
* */






// import 'package:flutter/material.dart';
// import 'dart:ffi';
// import 'package:firebase_core/firebase_core.dart';
// //import 'package:js/js.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
// class attendance extends StatelessWidget {
//   const attendance({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RecyclerViewPage(),
//     );
//   }
// }
//
// class RecyclerViewPage extends StatefulWidget {
//
//
//
//
//   @override
//   State<RecyclerViewPage> createState() => _RecyclerViewPageState();
// }
//
// class _RecyclerViewPageState extends State<RecyclerViewPage> {
//   List<String> movieList = [];
// bool conditionTrue = false;
//
//   List<Color> cardColors =[];
// var ptemp=[];
//   var atemp=[];
//   var temp=[];
//
// @override
// initState() {
//    getnames();
//   super.initState();
//
//
// }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         body: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: ListView.builder(
//             itemCount: movieList.length,
//
//             itemBuilder: (context, index) {
//               return GestureDetector(
//
//                 child: Card(
//
//                   color: cardColors[index],
//
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//
//                   ),
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   // color:Colors.white60,
//
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 27.0, horizontal: 20.0),
//                     child: Text(
//                       movieList[index],
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           wordSpacing: 4,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'sanserif'),
//                       textAlign: TextAlign.left,
//                       //movieList[index]
// //                   name[index],
//                     ),
//
//                   ),
//                 ),
//                 onTap: () => onTap(index),
//                 onDoubleTap: () =>
//                     onDoubleTap(index),
//                 onLongPress: () => onLongPress(index),
//
//               );
//             },
//           ),
//
//
//         ),
//
//         bottomNavigationBar: conditionTrue ? BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.done, color: Colors.blue),
//               label: 'Submit',
//
//             ),
//
//             BottomNavigationBarItem(
//               icon: Icon(Icons.cancel, color: Colors.red,),
//               label: 'Cancel',
//
//             ),
//           ],
//         ): null,
//
//
//     );
//
//   }
//
//   /**
//    * Database Fetching Function
//    */
//   CollectionReference _collectionRef =
//   FirebaseFirestore.instance.collection('students')
//       .doc('department')
//       .collection('Bca');
//
//   var i;
//   List name=[];
//   final List allData =[];
//   Map student={};
//   Future<List<String>> getData() async {
//     print('Processing');
//     //  Get docs from collection reference
//     QuerySnapshot querySnapshot = await _collectionRef.get();
//     // Get data from docs and convert map to List
//     final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//     List<String> temp = [];
//     // print(allData);
//     // return [];
//
//      for(var i=0;i<allData.length;i++)
//      {
//        student = allData.elementAt(i) as Map;
//
//        //name[i] = student['Name'];
//        temp.add(student["Name"]);
//
//
//      }
// return temp;
//   }
//
//
//    void getnames() async
//   {
//     var temp = await getData();
//      setState(() {
//        print('CallingGetnames');
//      movieList = temp;
//      //movieList.forEach((element) {cardColors.add(Colors.white);print(element);});
//        for(int i =0;i<movieList.length;i++)
//          {
//            cardColors.add(Colors.white);
//            print(movieList[i]);
//          }
//        movieList.sort();
//      });
//
//    }
//
//
//   void onTap(index) {
//     setState(() {
//      cardColors[index] = Color.fromARGB(255, 88, 215, 93);
//      conditionTrue = true;
//     });
//
//
//
//
//
//
//
//
//  /*   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text("${movieList[index]} In Single Tap"),
//     ));*/
//   }
//   void onLongPress(index) {
//     setState(() {
//       cardColors[index] =Color.fromARGB(255, 255, 255, 255);
//       conditionTrue =false;
//     });
//
//   }
//
//   void onDoubleTap(index) {
//     setState(() {
//       conditionTrue = true;
//       cardColors[index] = Color.fromARGB(255, 246, 94, 83);
//     });
//     /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text("${movieList[index]} In Double Tap"),
//     ));*/
//   }
// }
//
//
// /*
// *  width: MediaQuery.of(context).size.width / 1.1,
//                     height: MediaQuery.of(context).size.height / 9,
// * */
//
