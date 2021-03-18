import 'dart:async';
import 'dart:io';

import 'package:xdg_directories/xdg_directories.dart' as xdg;
import 'package:path/path.dart' as path;
import '../path_provider_platform_interface/path_provider_platform_interface.dart';

class PathProviderLinux extends PathProviderPlatform {
  static void register() {
    PathProviderPlatform.instance = PathProviderLinux();
  }

  @override
  Future<String?> getTemporaryPath() {
    return Future.value('/tmp');
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    final processName = path.basenameWithoutExtension(
        await File('/proc/self/exe').resolveSymbolicLinks());
    final directory = Directory(path.join(xdg.dataHome.path, processName));
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    return directory.path;
  }

  @override
  Future<String?> getApplicationDocumentsPath() {
    return Future.value(xdg.getUserDirectory('DOCUMENTS')?.path);
  }

  @override
  Future<String?> getDownloadsPath() {
    return Future.value(xdg.getUserDirectory('DOWNLOAD')?.path);
  }

  @override
  Future<String?> getRootPath() {
    return Future.value(xdg.getUserDirectory('')?.path);
  }

}
