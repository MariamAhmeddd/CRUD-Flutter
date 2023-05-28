# CRUD App

CRUD App is a simple Flutter application that allows you to perform CRUD (Create, Read, Update, Delete) operations on user data. It uses the GoRest API to fetch and manipulate user data.

## Features

- Display a list of users
- Create a new user
- Update an existing user
- Delete a user

## Installation

1. Make sure you have Flutter installed on your machine. If not, you can follow the instructions on the [Flutter website](https://flutter.dev) to install Flutter.
2. Clone this repository to your local machine using Git or download the source code as a ZIP file.
3. Open the project in your preferred Dart/Flutter IDE.
4. Run the following command in the terminal to download the required dependencies:
flutter pub get
5. Connect your device or start an emulator/simulator.
6. Run the application using the following command:
flutter run

## Usage

Upon launching the application, you will see a list of users retrieved from the GoRest API. You can tap on a user to view their details. From the user details screen, you can update the user's information or delete the user.

To create a new user, tap on the floating action button (the "+" icon) on the home screen. Fill in the required fields (name, email, gender, and status) and tap on the "Create" button.

## Project Structure

The project follows a simple structure:

- `lib/cubit`: Contains the Cubit classes responsible for managing application state and handling API requests.
- `lib/helper`: Contains the API class that interacts with the GoRest API.
- `lib/modules`: Contains the User model class.
- `lib/screens`: Contains the different screens of the application.
- `lib/main.dart`: The entry point of the application.

## Dependencies

The following dependencies are used in this project:

- `flutter_bloc`: State management library for Flutter.
- `http`: Package for making HTTP requests.


If you find any issues or have any suggestions, feel free to submit a pull request :)

