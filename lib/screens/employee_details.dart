import 'package:employee_api/models/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatefulWidget {
  final Employee empData; //

  EmployeeDetails({super.key, required this.empData});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Adding padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Employee Details",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16), // Space between title and details
            _buildDetailRow("First Name", widget.empData.firstName),
            _buildDetailRow("Email", widget.empData.email),
            _buildDetailRow("Salary",
                "\$${(widget.empData.salary + 5000).toString()}"), // Adding dollar sign for salary
            _buildDetailRow("Date of Birth", widget.empData.dob),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
