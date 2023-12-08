import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/state_data.dart';

class TextPage extends StatefulWidget with ChangeNotifier {
  TextPage({Key? key}) : super(key: key);

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Page'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    width: 200, // Set your desired width
                    height: 50, // Set your desired height
                    child: Text(
                      Provider.of<StateData>(context, listen: false)
                          .recognizedText,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3, // Set your desired max lines
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    width: 200, // Set your desired width
                    height: 100, // Increase the height
                    child: Text(
                      Provider.of<StateData>(context, listen: false)
                          .recognizedText,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6, // Increase the max lines
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
