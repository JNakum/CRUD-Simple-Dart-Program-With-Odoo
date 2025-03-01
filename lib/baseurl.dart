import 'package:my_project_dart/main.dart';

class BaseUrl {
  static String baseUrl =
      "https://ekikaflutter-18.dev.odoo-apps.ekika.co/gql-sample";

  static Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
      'x-api-key': env['X_API_KEY'] ?? '',
    };
  }
}
