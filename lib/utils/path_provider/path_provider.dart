import 'dart:async';
import 'dart:io' show Directory, Platform;
import 'package:flutter/foundation.dart' show kIsWeb, visibleForTesting;
import 'package:reid_client_flutter/utils/path_provider/linux/path_provider_linux.dart';
import 'package:reid_client_flutter/utils/path_provider/path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:reid_client_flutter/utils/path_provider/path_provider_platform_interface/src/method_channel_path_provider.dart';
import 'package:reid_client_flutter/utils/path_provider/windows/path_provider_windows.dart';

bool _manualDartRegistrationNeeded = true;

class MissingPlatformDirectoryException implements Exception {

  MissingPlatformDirectoryException(this.message, {this.details});

  final String message;

  final Object details;

  @override
  String toString() {
    String detailAddition = details == null ? '' : ': $details';
    return 'MissingPlatformDirectoryException($message)$detailAddition';
  }

}

PathProviderPlatform get _platform {
  if (_manualDartRegistrationNeeded) {
    if (!kIsWeb && PathProviderPlatform.instance is MethodChannelPathProvider) {
      if (Platform.isLinux) {
        PathProviderPlatform.instance = PathProviderLinux();
      } else if (Platform.isWindows) {
        PathProviderPlatform.instance = PathProviderWindows();
      }
    }
    _manualDartRegistrationNeeded = false;
  }
  return PathProviderPlatform.instance;
}

Future<Directory> getRootPath() async {
  final String path = await _platform.getRootPath();
  if (path == null) {
    throw MissingPlatformDirectoryException('Unable to get root directory');
  }
  return Directory(path);
}
