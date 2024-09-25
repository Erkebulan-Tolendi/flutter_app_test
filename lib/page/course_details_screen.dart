import 'package:flutter/material.dart';
import 'package:flutter_application_test/util/course_provider.dart';
import 'package:flutter_application_test/page/edit_course_screen.dart';
import 'package:provider/provider.dart';
import '../data/course.dart';
class CourseDetailsScreen extends StatelessWidget {
  final Course course;

  CourseDetailsScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Course'),
                    content:
                       const Text('Are you sure you want to delete this course?'),
                    actions: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      TextButton(
                        child: const Text('Delete'),
                        onPressed: () {
                          Provider.of<CourseProvider>(context, listen: false)
                              .deleteCourse(course.id!);
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pop(); 
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditCourseScreen(course: course),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(course.imagePath),
           const SizedBox(height: 16),
            Text(course.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
           const SizedBox(height: 16),
            Text('Lessons: ${course.lessonsCount}',
                style: const TextStyle(fontSize: 18)),
           const SizedBox(height: 16),
            Text(course.fullDescription, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
