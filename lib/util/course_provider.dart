import 'package:flutter/material.dart';
import '../data/database_helper.dart';
import '../data/course.dart';

class CourseProvider with ChangeNotifier {
  List<Course> _courses = [];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List<Course> get courses => _courses;

  Future<void> loadCourses() async {
    _courses = await _dbHelper.getCourses();
    notifyListeners();
  }

  Future<void> addCourse(Course course) async {
    await _dbHelper.insertCourse(course);
    await loadCourses();
  }

  Future<void> updateCourse(Course course) async {
    await DatabaseHelper().updateCourse(course);
    loadCourses();
  }

  Future<void> deleteCourse(int id) async {
    await DatabaseHelper().deleteCourse(id);
    loadCourses();
  }
}