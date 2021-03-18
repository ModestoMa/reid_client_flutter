import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:filesystem_picker/filesystem_picker.dart';

class OperationView extends StatefulWidget {
  @override
  _OperationViewState createState() => _OperationViewState();
}

class _OperationViewState extends State<OperationView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operation',
      home: OperationPage(),
    );
  }
}

class OperationPage extends StatefulWidget {
  @override
  _OperationPageState createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operation'),
        actions: [TextButton(onPressed: () {}, child: Text('reset'))],
        elevation: 0,
      ),
      body: OperationHome(),
    );
  }
}

class OperationHome extends StatefulWidget {
  @override
  _OperationHomeState createState() => _OperationHomeState();
}

class _OperationHomeState extends State<OperationHome> {

  Directory rootPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '提示：请将待检测人员和待检测数据库分别放置在两个文件夹中，以便于选择。',
          style: TextStyle(color: Colors.red),
        ),
        Row(
          children: [
            TextButton(
                onPressed: () async {
                  rootPath = await getDownloadsDirectory();
                  String path = await FilesystemPicker.open(
                    title: 'Save to folder',
                    context: context,
                    rootDirectory: rootPath,
                    fsType: FilesystemType.folder,
                    pickText: 'Save file to this folder',
                    folderIconColor: Colors.teal,
                  );
                  print(path);
                },
                child: Text('选择文件夹'))
          ],
        )
      ],
    );
  }
}
