import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyWidget(),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Add item to the TODO list'),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: const Color.fromARGB(255, 220, 225, 228),
            alignment: Alignment.center, //Changed to center
            child: const Text(
              'TODO list assignment two',
              style: TextStyle(
                fontSize: 20, // You can change this value as you need
              ),
            ),
          ),
        ),
        //Footer
        bottomNavigationBar: const BottomAppBar(
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Assignment 2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
