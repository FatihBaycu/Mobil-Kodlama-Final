import 'package:flutter/material.dart';
import 'package:mobil_kodlama_final/screens/home_screen.dart';
import 'package:mobil_kodlama_final/screens/http_screens.dart';
import 'package:mobil_kodlama_final/screens/insert_student.dart';
import 'package:mobil_kodlama_final/screens/work_group_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/WorkGroupScreen': (context) => WorkGroupScreen(),
        '/HttpScreen': (context) => HttpScreen(),
        '/InsertScreen': (context) => InsertScreen(),

      },
      theme: ThemeData(primaryColor: Colors.teal, accentColor: Colors.orange),
      home: HomeScreen(),
    ),
  );
}
