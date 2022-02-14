import 'package:flutter/material.dart';
import 'package:network/models/employees_model.dart';
import 'package:network/services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? data = "";

  void getUsers() {
    Network.GET(Network.API_LIST, Network.paramsEmpty())
        .then((value) => {showData(value!)});
  }

  void createData(Employee employee) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(employee))
        .then((value) => {showData(value!)});
  }

  void updateData(Employee employee) {
    Network.PUT(
            Network.API_UPDATE + employee.id!, Network.paramsUpdate(employee))
        .then((value) => {showData(value!)});
  }

  void deleteData(Employee employee) {
    Network.DEL(Network.API_DELETE + employee.id!, Network.paramsEmpty())
        .then((value) => {showData(value!)});
  }

  showData(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP Networking"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: (data!.isEmpty) ? CircularProgressIndicator() : Text(data!),
        ),
      ),
    );
  }
}
