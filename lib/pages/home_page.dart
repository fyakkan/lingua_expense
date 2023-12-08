import 'package:flutter/material.dart';
import 'package:lingua_expense/pages/text_page.dart';
import 'camera_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lingua Expense')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const CameraPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the border radius as needed
                ),
              ),
              child: Container(
                width: 100, // Adjust width as needed
                height: 40, // Adjust height as needed
                child: Center(
                  child: Text(
                    'Camera',
                    style: TextStyle(
                      fontSize: 16, // Adjust font size as needed
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        TextPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the border radius as needed
                ),
              ),
              child: Container(
                width: 100, // Adjust width as needed
                height: 40, // Adjust height as needed
                child: Center(
                  child: Text(
                    'Text',
                    style: TextStyle(
                      fontSize: 16, // Adjust font size as needed
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
