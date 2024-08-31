import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class takeattendance extends StatefulWidget {


  @override
  State<takeattendance> createState() => _takeattendanceState();
}

class _takeattendanceState extends State<takeattendance> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
      "hello\u200d😥",
      style: TextStyle(
          color: Colors.white,
          fontSize:40,
          //wordSpacing: 3,
          fontWeight: FontWeight.bold,
          fontFamily: 'sanserif'),
      textAlign: TextAlign.left,
      ) );
  }

  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('students')
      .doc('department')
      .collection('Bca');

  var i;

  final List allData =[];

  Map student={};

  getData() async {
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
}
