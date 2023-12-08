import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  PlatformFile? pickedFile;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lingua Expense')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pickedFile != null)
              Expanded(
                child: Container(
                  color: Colors.deepOrange,
                  child: Center(
                    child: Text(pickedFile!.name),
                  ),
                ),
              ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the border radius as needed
                ),
              ),
              child: const SizedBox(
                width: 100, // Adjust width as needed
                height: 40, // Adjust height as needed
                child: Center(
                  child: Text(
                    'Selected File',
                    style: TextStyle(
                      fontSize: 16, // Adjust font size as needed
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the border radius as needed
                ),
              ),
              child: const SizedBox(
                width: 100, // Adjust width as needed
                height: 40, // Adjust height as needed
                child: Center(
                  child: Text(
                    'Upload File',
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
