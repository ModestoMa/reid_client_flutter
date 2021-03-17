import 'dart:io';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

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
                  FilePickerCross myFile =
                      await FilePickerCross.importFromStorage(
                          type: FileTypeCross.any,
                          // Available: `any`, `audio`, `image`, `video`, `custom`. Note: not available using FDE
                          fileExtension:
                              'txt, md' // Only if FileTypeCross.custom . May be any file extension like `dot`, `ppt,pptx,odp`
                          );
                },
                child: Text('选择文件夹'))
          ],
        )
      ],
    );
  }
}
