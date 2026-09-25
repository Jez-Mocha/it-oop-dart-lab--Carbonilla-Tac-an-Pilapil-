import 'dart:io';

class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  String get name => _name;
  int get age => _age;

  set age(int value) {
    if (value >= 0) {
      _age = value;
    }
  }

  String introduce() {
    return "Hi, I'm $_name, $_age years old.";
  }
}

class Student extends Person {
  String _course;

  Student(String name, int age, this._course) : super(name, age);

  @override
  String introduce() {
    return "Hi, I'm $name, $age years old, studying $_course.";
  }
}

class Teacher extends Person {
  String _subject;

  Teacher(String name, int age, this._subject) : super(name, age);

  @override
  String introduce() {
    return "Hi, I'm $name, $age years old, teaching $_subject.";
  }
}
class Staff extends Person {
  Staff(String name, int age) : super(name, age);

  @override
  String introduce() {
    return "Hi, I'm $name, $age years old, staff.";
  }
}
class School {
  List<Person> people = [];

  void addPerson(Person p) {
    people.add(p);
  }

  void introduceAll() {
    print("\n=== School Roster ===");
    for (var person in people) {
      print(person.introduce());
    }
  }
}

String readText(String prompt) {
  while (true) {
    stdout.write(prompt);
    String input = stdin.readLineSync() ?? "";
    if (input.trim().isNotEmpty) {
      return input;
    }
    print("Input cannot be empty.");
  }
}

int readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    String input = stdin.readLineSync() ?? "";
    int? value = int.tryParse(input);

    if (value == null) {
      print("Enter a valid whole number.");
    } else if (value < 0) {
      print("Age cannot be negative.");
    } else {
      return value;
    }
  }
}

void main() {
  School school = School();

  print("=== School Personnel Management ===");

  int studentCount = readInt("How many students will you add? ");

  for (int i = 1; i <= studentCount; i++) {
    print("\n-- Student #$i --");
    String name = readText("Name: ");
    int age = readInt("Age: ");
    String course = readText("Course: ");

    school.addPerson(Student(name, age, course));
  }

  int teacherCount = readInt("\nHow many teachers will you add? ");

  for (int i = 1; i <= teacherCount; i++) {
    print("\n-- Teacher #$i --");
    String name = readText("Name: ");
    int age = readInt("Age: ");
    String subject = readText("Subject: ");

    school.addPerson(Teacher(name, age, subject));
  }
  int staffCount = readInt("\nHow many staff will you add? ");

  for (int i = 1; i <= staffCount; i++) {
    print("\n-- Staff #$i --");
    String name = readText("Name: ");
    int age = readInt("Age: ");

    school.addPerson(Staff(name, age,));
  school.introduceAll();
}
}