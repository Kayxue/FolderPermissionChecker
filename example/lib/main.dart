import 'package:flutter/material.dart';
import 'package:folder_permission_checker/folder_permission_checker.dart';

Future<void> main() async {
  await FolderPermissionChecker.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? result;

  @override
  void initState() {
    super.initState();
    FolderPermissionChecker.isReadonly('/Users/kay/Downloads').then((value) {
      setState(() {
        result = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Folder readonly test')),
        body: Center(
          child: Text(
            'Is /Users/kay/Downloads readonly? ${result ?? "Checking"}\n',
          ),
        ),
      ),
    );
  }
}
