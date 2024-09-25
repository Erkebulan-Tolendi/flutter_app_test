class Course {
  final int? id;
  final String title;
  final String shortDescription;
  final String fullDescription;
  final int lessonsCount;
  final String imagePath;

  Course(
      {this.id,
      required this.title,
      required this.shortDescription,
      required this.fullDescription,
      required this.lessonsCount,
      required this.imagePath});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'shortDescription': shortDescription,
      'fullDescription': fullDescription,
      'lessonsCount': lessonsCount,
      'imagePath' : imagePath,
    };
  }

  static Course fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'],
      title: map['title'],
      shortDescription: map['shortDescription'],
      fullDescription: map['fullDescription'],
      lessonsCount: map['lessonsCount'],
      imagePath: map['imagePath'] ?? '',
    );
  }
}
