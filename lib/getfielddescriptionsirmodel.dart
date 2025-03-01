import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project_dart/baseurl.dart';

// void main() {
//   getFieldDescriptions();
// }

Future<Map<String, String>> getFieldDescriptions() async {
  String url = BaseUrl.baseUrl;
  var headers = BaseUrl.getHeaders();

  var body = jsonEncode({
    "query": """
              query MyQuery(\$domain:[[Any]]){
                IrModelFields(domain:\$domain) {
                  name 
                  field_description
                }
              }
      """,
    "variables": {
      "domain": [
        ["model", "=", "learn.basic.fields"],
        [
          "name",
          "in",
          ["id", "name", "age", "salary", "gender"]
        ]
      ],
    },
  });

  var response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  var jsonResponse = jsonDecode(response.body);

  Map<String, String> fieldDescriptions = {};

  for (var field in jsonResponse["data"]["IrModelFields"]) {
    fieldDescriptions[field["name"]] = field["field_description"];
  }
  print("$fieldDescriptions");

  return fieldDescriptions;
}
