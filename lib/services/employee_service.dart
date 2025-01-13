import 'package:dio/dio.dart';
import 'package:employee_api/models/employee_model.dart';

class EmployeeService {
  String endpoint = "https://mocki.io/v1/283ba093-9bf9-42e4-8f28-d2538937f9ca";
  final dio = Dio();
  Future<List<Employee>> getEmploye() async {
    List<Employee> empList = [];

    try {
      final response = await dio.get(endpoint);
      var data = response.data;
      data.forEach((emp) {
        empList.add(Employee.fromJson(emp));
      });

      empList.forEach((emp) {
        print(
            " employee Name : ${emp.firstName},  employee Salary:${emp.salary}");
      });
    } catch (e) {
      print(e);
    }
    return empList;
  }
}
