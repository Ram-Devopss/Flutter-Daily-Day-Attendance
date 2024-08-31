import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class example extends StatefulWidget {
  const example({Key? key}) : super(key: key);

  @override
  State<example> createState() => _exampleState();


}

class _exampleState extends State<example> {
  String text = "Hello";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: GestureDetector(
              onTap: () async{
                text= await ValueFromFirebase();
                setState(() {

                });
              },
              child: Card(
                child: Text(
                  text,
                ),
              ),
            )));
  }

  Future<String> ValueFromFirebase() async {
    var  temp = await FirebaseFirestore.instance.collection('example').doc('x').get();
    print("$temp Your Temp");

    return temp.data()!['name']!;
  }
}
