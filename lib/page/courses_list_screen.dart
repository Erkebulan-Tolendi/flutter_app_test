import 'package:flutter/material.dart';
import 'package:flutter_application_test/page/add_course_screen.dart';
import 'package:flutter_application_test/page/course_details_screen.dart';
import 'package:provider/provider.dart';
import '../util/course_provider.dart';
import '../data/course.dart';

class CoursesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<CourseProvider>(context).loadCourses();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCourseScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<CourseProvider>(
        builder: (context, provider, _) {
          return ListView.builder(
            itemCount: provider.courses.length,
            itemBuilder: (context, index) {
              Course course = provider.courses[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double
                          .infinity,
                      child: Image.network(
                          course.imagePath,
                          width: double.infinity, 
                          height: 250,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.image_not_supported);
                          },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        course.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(course.shortDescription),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CourseDetailsScreen(course: course),
                          ),
                        );
                      },
                      child: Container(
                        height: 50, 
                        color:
                            Colors.transparent,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
