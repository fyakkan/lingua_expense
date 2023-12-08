import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lingua_expense/pages/home_page.dart';
import 'package:lingua_expense/Provider/state_data.dart';
import 'package:provider/provider.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<StateData>(
      create: (BuildContext context) => StateData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Translator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage()
    );
  }
}
