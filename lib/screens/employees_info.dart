import 'dart:convert';

import 'package:employee_api/models/employee_model.dart';
import 'package:employee_api/screens/employee_details.dart';
import 'package:employee_api/services/employee_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeesInfo extends StatefulWidget {
  const EmployeesInfo({super.key});

  @override
  State<EmployeesInfo> createState() => _EmployeesInfoState();
}

class _EmployeesInfoState extends State<EmployeesInfo> {
  List<Employee> employeesCached = [];

  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    getEmps(); // Load employees data when the widget is initialized
  }

  getEmps() async {
    await Future.delayed(Duration(seconds: 3));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('empData') ?? "";
    var jsonData = jsonDecode(data);
    jsonData.forEach((emp) {
      employeesCached.add(Employee.fromJson(emp));
    });
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings),
        backgroundColor: Colors.green,
        title: Text(
          "Employees Data",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Column(
              children: [
                Text("Employees Data"),
                Flexible(
                  child: ListView.builder(
                    itemCount: employeesCached.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeeDetails(
                                empData: employeesCached[index],
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Text(employeesCached[index].id.toString()),
                          title: Text(employeesCached[index].firstName),
                          subtitle: Text(employeesCached[index].email),
                          textColor: const Color.fromARGB(255, 28, 27, 14),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
