import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'util/course_provider.dart';
import 'page/courses_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CourseProvider(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Courses App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CoursesListScreen(),
      ),
    );
  }
}
