import 'dart:io';
import '../utils/path_provider/path_provider.dart';
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
  String personPath = '';
  String dataPath = '';

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned(
            child: Text('提示：请将待检测人员和待检测数据库分别放置在两个文件夹中，以便于选择。',
                style: TextStyle(color: Colors.red, fontSize: 16)),
            top: 5,
            left: 10,
          ),
          Positioned(
            child: Text('选择待检测目标所在文件夹: $personPath'),
            top: 40,
            left: 10,
          ),
          Positioned(
            child: MaterialButton(
              height: 40,
              child: Text('选择文件夹'),
              color: Colors.blue,
              onPressed: () async {
                Directory rootPath = await getRootPath();
                String path = await FilesystemPicker.open(
                  title: '选择待检测目标所在文件夹',
                  context: context,
                  rootDirectory: rootPath,
                  fsType: FilesystemType.folder,
                  pickText: '确定选择',
                  folderIconColor: Colors.teal,
                );
                print(path);
                setState(() {
                  personPath = path;
                });
              },
            ),
            top: 70,
            left: 10,
          ),
          Positioned(
            child: Text('选择待检测数据库所在文件夹: $dataPath'),
            top: 110,
            left: 10,
          ),
          Positioned(
            child: MaterialButton(
              height: 40,
              child: Text('选择文件夹'),
              color: Colors.blue,
              onPressed: () async {
                Directory rootPath = await getRootPath();
                String path = await FilesystemPicker.open(
                  title: '选择待检测数据库所在文件夹',
                  context: context,
                  rootDirectory: rootPath,
                  fsType: FilesystemType.folder,
                  pickText: '确定选择',
                  folderIconColor: Colors.teal,
                );
                print(path);
                setState(() {
                  dataPath = path;
                });
              },
            ),
            top: 140,
            left: 10,
          )
        ],
      ),
    );
    // return Column(
    //   children: [
    //     Text(
    //       '提示：请将待检测人员和待检测数据库分别放置在两个文件夹中，以便于选择。',
    //       style: TextStyle(color: Colors.red),
    //     ),
    //     Row(
    //       children: [
    //         Text(personPath),
    //         TextButton(
    //             onPressed: () async {
    //               rootPath = await getRootPath();
    //               String path = await FilesystemPicker.open(
    //                 title: '选择待检测目标所在文件夹',
    //                 context: context,
    //                 rootDirectory: rootPath,
    //                 fsType: FilesystemType.folder,
    //                 pickText: '确定选择',
    //                 folderIconColor: Colors.teal,
    //               );
    //               print(path);
    //               setState(() {
    //                 personPath = path;
    //               });
    //             },
    //             child: Text('选择文件夹')),
    //         Text(dataPath),
    //         TextButton(
    //             onPressed: () async {
    //               rootPath = await getRootPath();
    //               String path = await FilesystemPicker.open(
    //                 title: '选择待检测数据库所在文件夹',
    //                 context: context,
    //                 rootDirectory: rootPath,
    //                 fsType: FilesystemType.folder,
    //                 pickText: '确定选择',
    //                 folderIconColor: Colors.teal,
    //               );
    //               print(path);
    //               setState(() {
    //                 dataPath = path;
    //               });
    //             },
    //             child: Text('选择文件夹')),
    //       ],
    //     )
    //   ],
    // );
  }
}

class ChooseFolder extends StatefulWidget {
  ChooseFolder({this.folderPath});

  String folderPath = '';

  @override
  _ChooseFolderState createState() => _ChooseFolderState();
}

class _ChooseFolderState extends State<ChooseFolder> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('待检测目标所在文件夹：${widget.folderPath}'),
        MaterialButton(
          onPressed: () async {
            print('choose target person folder');
            Directory rootPath = await getRootPath();
            String path = await FilesystemPicker.open(
              title: '选择待检测数据库所在文件夹',
              context: context,
              rootDirectory: rootPath,
              fsType: FilesystemType.folder,
              pickText: '确定选择',
              folderIconColor: Colors.teal,
            );
            print(path);
            setState(() {
              widget.folderPath = path;
            });
          },
          child: Text('选择文件夹'),
        )
      ],
    );
  }
}
