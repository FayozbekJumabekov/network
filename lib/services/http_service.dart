import 'dart:convert';
import 'package:http/http.dart';
import '../models/employees_model.dart';
import 'log_service.dart';

class Network {
  /// Set isTester ///
  static bool isTester = true;

  /// Servers Types ///
  static String SERVER_DEVELOPMENT = "dummy.restapiexample.com";
  static String SERVER_PRODUCTION = "dummy.restapiexample.com";

  /// Getting Header ///
  // static Map<String, String> getHeaders() {
  //   Map<String, String> header = {
  //     "Content-Type": "application/json; charset=UTF-8"
  //   };
  //   return header;
  // }

  /// Selecting Test Server or Production Server  ///

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  ///* Http Requests *///

  /// GET method///
  static Future<String?> GET(String api, Map<String, String> params) async {
    Uri uri = Uri.https(getServer(), api, params);
    Response response = await get(uri);
    Log.d(response.body);
    if (response.statusCode == 200) return response.body;
    return null;
  }

  /// POST method///
  static Future<String?> POST(String api, Map<String, String> params) async {
    Uri uri = Uri.https(getServer(), api, params);
    Response response =
        await post(uri,body: jsonEncode(params));
    Log.d(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }
  /// PUT method///
  static Future<String?> PUT(String api, Map<String, String> params) async {
    Uri uri = Uri.https(getServer(), api, params);
    Response response =
        await put(uri, body: jsonEncode(params));
    Log.d(response.body);
    if (response.statusCode == 200) return response.body;
    return null;
  }

  /// PATCH ///
  static Future<String?> PATCH(String api, Map<String, String> params) async {
    var uri = Uri.https(getServer(), api); // http or https
    var response =
        await patch(uri, body: jsonEncode(params));
    Log.d(response.body);
    if (response.statusCode == 200) return response.body;

    return null;
  }

  /// DELETE ///
  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(getServer(), api, params); // http or https
    var response = await delete(uri);
    Log.d(response.body);
    if (response.statusCode == 200) return response.body;
    return null;
  }

  /// * Http Apis *///
  static String API_LIST = "/api/v1/employees";
  static String API_SINGLE_LIST = "/api/v1/employee/";  //{id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}

  /// * Http Params * ///
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  /// Create Post ///
  static Map<String, String> paramsCreate(Employee employee) {
    Map<String, String> params = {};
    params.addAll({
      'employee_name': employee.employee_name,
      'employee_salary': employee.employee_salary,
      'employee_age': employee.employee_age,
    });
    return params;
  }

  /// UPDATE POST ///

  static Map<String, String> paramsUpdate(Employee employee) {
    Map<String, String> params = {};
    params.addAll({
      'employee_name': employee.employee_name,
      'employee_salary': employee.employee_salary,
      'employee_age': employee.employee_age,
      'id' : employee.id!,
      'profile_image':employee.profile_image!
    });
    return params;
  }
}
