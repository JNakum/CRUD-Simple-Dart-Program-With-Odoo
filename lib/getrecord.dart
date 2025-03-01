import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project_dart/baseurl.dart';

getAllRecord() async {
  String url = BaseUrl.baseUrl;

  var headers = BaseUrl.getHeaders();

  var body = jsonEncode({
    "query": """
                          query MyQuery(\$domain:[[ANY]]){
                                LearnBasicFields{
                                                    id
                                                    name
                                                    age
                                                    salary
                                                    gender
                                                    
                                                }
                                                IrModelFields(domain:\$domain){
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
          [
            "id",
            "name",
            "age",
            "salary",
            "gender",
          ]
        ]
      ],
    }
  });

  var response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );
  print("Status Code => ${response.statusCode}");
  print("Response => ${response.body}");
}
