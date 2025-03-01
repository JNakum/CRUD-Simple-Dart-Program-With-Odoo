import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:my_project_dart/getrecord.dart';
import 'package:my_project_dart/insertrecord.dart';

final DotEnv env = DotEnv()..load();

void main() async {
  print("Hello Word Welcome To dart..!");
  await getAllRecord();
  DotEnv().load();

  print("\nDo you want to insert a new record? (yes/no)");
  String choice = stdin.readLineSync()?.toLowerCase() ?? 'no';

  if (choice == 'yes') {
    insertRecord();
  }
}
