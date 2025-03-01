class BasicRecordModel {
  final String name;
  final int age;
  final double salary;
  final String gender;

  BasicRecordModel(
      {required this.name,
      required this.age,
      required this.salary,
      required this.gender});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
      "salary": salary,
      "gender": gender,
    };
  }
}
