import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Database extends StatefulWidget {
  const Database({Key? key}) : super(key: key);

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  late final String Student;

  Widget build(BuildContext context) {
    return
      Scaffold(
        body: (Container(
          child: ElevatedButton(
            child: Text("Click Me Print Data"), onPressed: () async {
            final snapshot = await FirebaseFirestore.instance.collection(
                'students').doc(
                'department').collection('Bca').doc('001').get();
            if (false
            /*snapshot.exists*/) {
              print(snapshot.data());
            } else {
              print("Get Data");
              getData();
            }

            // Query Student = FirebaseFirestore.instance.collection('students').doc('department').collection('Bca').doc('001').get() as Query<Object?>;
            // print(Student);
          },),
        )),
      );
  }

   Future getDocs() async {
     QuerySnapshot querySnapshot = (await FirebaseFirestore.instance.collection(
         'students').doc('department').collection('department').get());
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
     print(allData);
   for (int i = 0; i < allData.length; i++) {
    var a = querySnapshot.docs[i];
     print(a);
  }
     }
  }


 CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('students')
      .doc('department')
       .collection('Bca');

var i;
final List allData =[];
Map student={};
   Future<void> getData() async {
   //  Get docs from collection reference
   QuerySnapshot querySnapshot = await _collectionRef.get();
    // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  /* for(var i=0;i<allData.length;i++)
     {
       student = allData.elementAt(i) as Map;
       print(student['Name']);
       print(student['Section']);
       print(student['Mobile Number']);
     }*/
     print(allData);


   }




//
//
// List<Need> yourNeeds=[];
// await firestore.collection("Need")
//         .getDocuments()
//         .then((QuerySnapshot snapshot) {
//        snapshot.documents.forEach((f) {
//             Needs obj= new Need();
//
//         obj.field1=f.data['field1'].toString();
//         obj.field2=f.data['field2'].toDouble();
//
//         //Adding value to your Need list
//         yourNeeds.add(obj);
// });
// * */
