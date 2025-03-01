import 'dart:io';

import 'package:my_project_dart/getfielddescriptionsirmodel.dart';
import 'package:my_project_dart/model/basicrecordmodel.dart';
import 'package:my_project_dart/provider/basicrecordprovider.dart';

void insertRecord() async {
  Map<String, String> fieldDescriptions = await getFieldDescriptions();
  // print("Enter Name:");
  print("${fieldDescriptions["name"] ?? 'skfk'}:");
  String name = stdin.readLineSync() ?? "";

  // print("Enter Age:");
  print("${fieldDescriptions["age"] ?? 'skfk'}  :");
  int age = int.parse(stdin.readLineSync() ?? "0");

  // print("Enter Salary:");
  print("${fieldDescriptions["salary"] ?? 'skfk'} :");
  double salary = double.parse(stdin.readLineSync() ?? "0");

  // print("Enter Gender:");
  print("${fieldDescriptions["gender"] ?? 'skfk'}  :");
  String gender = stdin.readLineSync() ?? "";

  BasicRecordModel newRecord =
      BasicRecordModel(name: name, age: age, salary: salary, gender: gender);
  await BasicRecordProvider().insertBasicRecord(newRecord);
}
