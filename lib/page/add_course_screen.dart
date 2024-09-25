import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../util/course_provider.dart';
import '../data/course.dart';

class AddCourseScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController shortDescriptionController =
      TextEditingController();
  final TextEditingController fullDescriptionController =
      TextEditingController();
  final TextEditingController lessonsCountController = TextEditingController();
  final TextEditingController imageUrlController =
      TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: shortDescriptionController,
              decoration: InputDecoration(labelText: 'Short Description'),
            ),
            TextField(
              controller: fullDescriptionController,
              decoration: InputDecoration(labelText: 'Full Description'),
            ),
            TextField(
              controller: lessonsCountController,
              decoration: InputDecoration(labelText: 'Lessons Count'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: imageUrlController, 
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final course = Course(
                  title: titleController.text,
                  shortDescription: shortDescriptionController.text,
                  fullDescription: fullDescriptionController.text,
                  lessonsCount: int.parse(lessonsCountController.text),
                  imagePath:
                      imageUrlController.text, 
                );

                Provider.of<CourseProvider>(context, listen: false)
                    .addCourse(course);
                Navigator.pop(context);
              },
              child: Text('Add Course'),
            ),
          ],
        ),
      ),
    );
  }
}
