import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project_dart/baseurl.dart';
import 'package:my_project_dart/model/basicrecordmodel.dart';

class BasicRecordProvider {
  Future<void> insertBasicRecord(BasicRecordModel record) async {
    String url = BaseUrl.baseUrl;
    var headers = BaseUrl.getHeaders();

    var body = jsonEncode({
      "query": """
        mutation Create{
        insertBasicRecord:LearnBasicFields(LearnBasicFieldsValues:{
            name: "${record.name}",
            age: "${record.age}",
            salary: "${record.salary}",
            gender: "${record.gender}",
            }){
            name 
            age
            salary
            gender
            }
        }
""",
    });
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print("Status Code => ${response.statusCode}");
    print("Response => ${response.body}");
  }
}
