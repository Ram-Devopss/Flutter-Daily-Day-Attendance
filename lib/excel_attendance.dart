import 'dart:io';
import 'package:Attendance/present_and_absentlists.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';

class excel_attendance extends StatefulWidget {
  const excel_attendance({super.key, required this.present, required this.absent});
  final present;
  final absent;
  @override
  State<excel_attendance> createState() => _excel_attendanceState();
}

class _excel_attendanceState extends State<excel_attendance> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth =  MediaQuery.of(context).size.width;
    return Scaffold(

        appBar: AppBar(
          title: Text('Excel'),
        ),
        body: Center(
          child: ElevatedButton(child: Text("Generate Excel"), onPressed: () {
            _createExcel(widget.present, widget.absent);
          },),
        )
    );
  }


  Future<void> _createExcel(present, absent) async {
    final List com = present;
    final List notcom = absent;

    /// Creating A Excel WorkBook
    final Workbook workbook = Workbook();

    // Adding A Index Of Excel Starts From 0
    final Worksheet sheet = workbook.worksheets[0];

/*
    // Adds Data Into The Specific Cell

    // College Heading
    sheet.getRangeByName('A1').autoFitRows();
    sheet.getRangeByName('A1').autoFitColumns();
    sheet.getRangeByName('A1').setText("APOLLO ART'S AND SCIENCE COLLEGE POONAMALLE");



 sheet.getRangeByName('A3').autoFitRows();
sheet.getRangeByName('A3').autoFitColumns();

sheet.getRangeByName('B3').autoFitRows();
sheet.getRangeByName('B3').autoFitColumns();

sheet.getRangeByName('C3').autoFitRows();
sheet.getRangeByName('C3').autoFitColumns();

sheet.getRangeByName('D3').autoFitRows();
sheet.getRangeByName('D3').autoFitColumns();

 sheet.getRangeByName('A3').setText('S.NO');
 sheet.getRangeByName('B3').setText('STUDENTS NAMES');
 sheet.getRangeByName('E3').setText('PRESENT');
 sheet.getRangeByName('G3').setText('ABSENT');
*/

    // Heading - College Name
    String col = "APOLLO ARTS AND SCIENCE COLLEGE - POONAMALLE";
    sheet.getRangeByIndex(1, 4).setValue(col);
    sheet
        .getRangeByIndex(1, 1)
        .cellStyle
        .fontSize = 90;
    sheet.getRangeByIndex(1, 1).autoFit();


    /*
      ATTENDANCE TITLE ( S.NO, STUDENTS NAMES, PRESENTS AND ABSENT

 */
//Total Strength

    print("Your Present List : ${com}");
    print("Your Absent List : ${notcom}");
    final List temp = com + notcom;
    print('Total Students ${temp.length}');
    print('Total Students ${temp}');



// SNO


    sheet.getRangeByIndex(3, 1).setText('SNO');
    sheet
        .getRangeByIndex(3, 1)
        .cellStyle
        .bold;
    sheet.getRangeByIndex(3, 1).autoFit();

    // SNO LOOP
    int s = 5;
    int n = 1;
    for (int sno = 0; sno < temp.length; sno++) {
      final cell = sheet.getRangeByIndex(s, 1);
      cell.cellStyle.bold;
      cell.setValue(n);

      n = n + 1;
      s = s + 1;
    }


    //STUDENTS NAMES

    sheet.getRangeByIndex(3, 2).setText('STUDENTS NAMES');
    sheet
        .getRangeByIndex(3, 2)
        .cellStyle
        .bold;
    sheet.getRangeByIndex(3, 2).autoFit();

    // STUDENTS LOOP
    int f = 5;
    int i = 0;
    for (int std_n = 0; std_n < temp.length; std_n++) {
      final cell = sheet.getRangeByIndex(f, 2);
      cell.setValue(temp[i]);
      cell.cellStyle.bold;

      f = f + 1;
      i = i + 1;
    }
    //PRESENTS

    sheet.getRangeByIndex(3, 3).setText('PRESENTS');
    sheet
        .getRangeByIndex(3, 3)
        .cellStyle
        .bold;
    sheet.getRangeByIndex(3, 3).autoFit();

    // PRESENTS LOOP
    int ss = 5;
    int index=0;
    for(int pre=0;pre<com.length;pre++)
    {
      final cell = sheet.getRangeByIndex(ss, 3);
      ss= ss+1;
      cell.setValue('✔');
      index = index+1;
      cell.cellStyle.bold;

    }

    // ABSENTS

    sheet.getRangeByIndex(3, 4).setText('ABSENTS');
    sheet.getRangeByIndex(3, 4).cellStyle.bold;
    sheet.getRangeByIndex(3, 4).autoFit();

    /// ABSENT LOOP

    int ie=0;
    for(int pre=0;pre<notcom.length;pre++)
    {
      final cell = sheet.getRangeByIndex(ss, 4);
      ss= ss+1;
      cell.setValue('❌');
      ie = ie+1;
      cell.cellStyle.bold;

    }

// Date Time
    sheet.getRangeByIndex(ss+2, 1).setText('DATE TIME -');
    sheet.getRangeByIndex(ss+2, 1).autoFit();
    sheet.getRangeByIndex(ss+2, 1).cellStyle.bold;

    sheet.getRangeByIndex(ss+2, 2).setText('${DateTime.now()}');
    sheet.getRangeByIndex(ss+2, 2).cellStyle.bold;
    sheet.getRangeByIndex(ss+2,2).autoFit();


    // TOTAL PRESENTS


    sheet.getRangeByIndex(ss+2, 3).setText('TOTAL PRESENT - ${com.length}');
    sheet.getRangeByIndex(ss+2, 3).autoFit();
    sheet.getRangeByIndex(ss+2, 3).cellStyle.bold;


    // TOTAL ABSENTS

    sheet.getRangeByIndex(ss+2, 4).setText('TOTAL ABSENT - ${notcom.length}');
    sheet.getRangeByIndex(ss+2,4).autoFit();
    sheet.getRangeByIndex(ss+2, 4).cellStyle.bold;

    // Save The Excel And Convert As A Integer Into Bytes
    final List<int> bytes = workbook.saveAsStream();

    // Get Android Paths
    final String path = (await getApplicationSupportDirectory()).path;

    // Storing Excel Into Specific Path
    final String fileName = '/storage/emulated/0/Android/data/com.example.apollo/files/(${DateTime
        .now()}) Apollo Attendance.xlsx';
    print(path);


    // For Opening Excel Into The Emulater
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }
}
