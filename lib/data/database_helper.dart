import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'course.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(
        await getDatabasesPath(), 'new_courses.db');
    return await openDatabase(
      path,
      version: 1, 
      onCreate: (db, version) async {
    
        await db.execute(
          'CREATE TABLE courses (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, shortDescription TEXT, fullDescription TEXT, lessonsCount INTEGER, imagePath TEXT)',
        );
      },
    );
  }


  Future<void> insertCourse(Course course) async {
    final db = await database;
    await db.insert('courses', course.toMap());
  }

 
  Future<List<Course>> getCourses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('courses');

    return List.generate(maps.length, (i) {
      return Course.fromMap(maps[i]);
    });
  }

 
  Future<int> updateCourse(Course course) async {
    final db = await database;
    return await db.update(
      'courses',
      course.toMap(),
      where: 'id = ?',
      whereArgs: [course.id],
    );
  }


  Future<int> deleteCourse(int id) async {
    final db = await database;
    return await db.delete(
      'courses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
