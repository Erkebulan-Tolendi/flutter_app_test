import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../util/course_provider.dart';
import '../data/course.dart';

class EditCourseScreen extends StatelessWidget {
  final Course course;

  EditCourseScreen({required this.course});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController shortDescriptionController =
      TextEditingController();
  final TextEditingController fullDescriptionController =
      TextEditingController();
  final TextEditingController lessonsCountController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  void initState() {
    titleController.text = course.title;
    shortDescriptionController.text = course.shortDescription;
    fullDescriptionController.text = course.fullDescription;
    lessonsCountController.text = course.lessonsCount.toString();
    imageUrlController.text = course.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: shortDescriptionController,
              decoration: const InputDecoration(labelText: 'Short Description'),
            ),
            TextField(
              controller: fullDescriptionController,
              decoration: const InputDecoration(labelText: 'Full Description'),
            ),
            TextField(
              controller: lessonsCountController,
              decoration: const InputDecoration(labelText: 'Lessons Count'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
           const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedCourse = Course(
                  id: course.id,
                  title: titleController.text,
                  shortDescription: shortDescriptionController.text,
                  fullDescription: fullDescriptionController.text,
                  lessonsCount: int.parse(lessonsCountController.text),
                  imagePath: imageUrlController.text,
                );

                Provider.of<CourseProvider>(context, listen: false)
                    .updateCourse(updatedCourse);
                Navigator.pop(context);
              },
              child: const Text('Update Course'),
            ),
          ],
        ),
      ),
    );
  }
}
