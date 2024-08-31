
import 'excel_attendance.dart';
import'package:flutter/material.dart';
class pr_ab_list extends StatefulWidget {

  final List present;
  final List absent;
  const pr_ab_list({required this.present,required this.absent,super.key});

  @override
  State<pr_ab_list> createState() => _pr_ab_listState();
}

class _pr_ab_listState extends State<pr_ab_list> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:Container(child:
        DefaultTabController(
          length: 2, // Number of tabs
          child: Scaffold(
              appBar: AppBar(
                title: Text("Presents & Absents List",textAlign: TextAlign.center,style:TextStyle(fontSize: 25,color: Colors.white60),),backgroundColor: Colors.black,


                bottom: TabBar(
                  tabs: [
                    Tab(child: Text('Presents'),icon: Icon(Icons.person_add,color:Colors.blue),),
                    Tab(child: Text('Absents'),icon: Icon(Icons.person_remove,color:Colors.red),),

                  ],
                ),
              ),

              body: TabBarView(
                children: [
                  Center(child:std_present(present: widget.present)),
                  Center(child: std_absent(absent: widget.absent)),
                ],
              ),
              bottomNavigationBar: Container(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('Make It Excel -->>>>>>>',style: TextStyle(fontFamily: 'sanserif',fontStyle:FontStyle.italic,fontSize: 20,backgroundColor: Colors.white60,color: Colors.black),),
                        IconButton(
                          enableFeedback: true,
                          tooltip:'Submit✌' ,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => excel_attendance(present: widget.present,absent: widget.absent)));

                            //generateExcel();
                          },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.blue,
                            size: 35,
                          ),

                        ),]))


          ),
        ))

    );
  }
}

class std_present extends StatefulWidget {
  const std_present({super.key, required this.present});

  final List present;


  @override
  State<std_present> createState() => _std_presentState();
}

class _std_presentState extends State<std_present> {
  @override



  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

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
          itemCount: widget.present.length,

          itemBuilder: (context, index) {
            return GestureDetector(

              child: Card(

                color: Colors.white60,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),

                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // color:Colors.white60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 27.0, horizontal: 20.0),
                  child: Text(
                    widget.present[index],
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
              // onTap: () => onTap(index),
              onHorizontalDragCancel: () => onDoubleTap(index),

              // onLongPress: () => onLongPress(index),
            );
          },

        ),


      ),
    );}


  void onDoubleTap(index) {

    print('hello Double Tab');
  }


}



class std_absent extends StatefulWidget {
  const std_absent({super.key, required this.absent});
  final List absent;
  @override
  State<std_absent> createState() => _std_absentState();
}

class _std_absentState extends State<std_absent> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(

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
          itemCount:widget.absent.length,

          itemBuilder: (context, index) {
            return GestureDetector(

              child: Card(

                color:Colors.white60,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),

                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                // color:Colors.white60,

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 27.0, horizontal: 20.0),
                  child: Text(
                    widget.absent[index],
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
              // onTap: () => onTap(index),
              // onDoubleTap: () =>
              //     onDoubleTap(index),
              // onLongPress: () => onLongPress(index),

            );
          },
        ),


      ),
    );
  }


// Generating Execel Sheet




}
