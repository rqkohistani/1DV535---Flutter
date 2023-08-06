# [Linneas University:Introduction to App Development with Flutter ](https://lnu.se/en/course/introduction-to-app-development-with-flutter/vaxjo-distance-international-part-time-summer/)

### [Assignment 1: The Me card](./assignmentOne/README.md)

### [Assignment 2: ToDO list](./assignmentTwo/README.md)

### [Assignment 3: Weather Application](./assignmentThree/README.md)

***

## Running the Flutter App

1. Clone the repository
2. Navigate to the assignment folder
3. Open the terminal and run the following command:

```bash
flutter pub get
```

4. Other information will be in the README.md file in the assignment folder

***

## Submission

1. Clean up the code

```bash
flutter clean
```

***

## Flutter Commands Guide

Flutter comes with a rich set of command line tools. Below are some of the most commonly used ones:

```bash
flutter clean
```

This command checks your environment and displays a report to the terminal window. The Dart SDK is bundled with Flutter; it is not necessary to install Dart separately.

```bash
flutter create project_name
```

This command creates a new Flutter project. Replace `project_name` with your preferred name for the project.

```bash
flutter run
```

This command runs your Flutter application. If you have a running emulator or a connected device, it runs the application there.

```bash
flutter build
```

This command is used to build a binary of the app, which is ready to install on devices or simulators. You can specify the type of binary by adding a platform type command like `apk`, `ios`, `web`, etc. For example, `flutter build apk`.

```bash
flutter devices
```

This command shows the list of devices or emulators that are currently running and on which you can run your Flutter application.

```bash
flutter clean
```

This command deletes the `build/` directory. It is often required when you get build-related issues, and you want to start fresh.

```bash
flutter pub get
```

This command fetches all the dependencies mentioned in the `pubspec.yaml` file. It's similar to `npm install` for Node.js.

```bash
flutter upgrade
```

This command upgrades your Flutter SDK to the latest version.

```bash
flutter analyze
```

This command performs a static analysis of your project's Dart code, looking for potential errors and warnings.

```bash
flutter format
```

This command formats your Dart code following the Dart's official style guide.

```bash
flutter test
```

This command runs all the tests in your project and gives a report.

***
