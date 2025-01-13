# Fetch Employee Data Using DIO and Parse JSON to Model

## Overview

This project demonstrates how to fetch employee data from an external API using the `DIO` package in Dart, parse the JSON responses, and map them to an `Employee` model. The data is fetched asynchronously and mapped to the `Employee` model class for further use within your application.

## Project Structure

The project is organized into the following directories:

- **`lib/services`**: Contains the service logic that handles the network requests using `DIO`.
- **`lib/models`**: Contains the `Employee` model class, which defines the structure of an employee object and includes JSON serialization and deserialization methods.

## Dependencies

- **DIO**: A powerful HTTP client for Dart that provides an easy way to make requests and handle responses.

Add the following to your `pubspec.yaml` file to include the necessary dependencies:

```yaml
dependencies:
  dio: ^5.1.0
  flutter:
    sdk: flutter

```
## How it Works
# EmployeeService

    The EmployeeService class fetches the employee data from a remote API using the DIO package. The response is parsed as JSON, and each JSON object is mapped to an instance of the Employee model. The service returns a list of Employee objects.