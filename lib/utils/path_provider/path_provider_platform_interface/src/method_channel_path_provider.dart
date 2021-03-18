import 'dart:async';

import 'enums.dart';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import '../path_provider_platform_interface.dart';
import 'package:platform/platform.dart';

class MethodChannelPathProvider extends PathProviderPlatform {
  @visibleForTesting
  MethodChannel methodChannel =
      MethodChannel('plugins.flutter.io/path_provider');

  Platform _platform = const LocalPlatform();

  @visibleForTesting
  void setMockPathProviderPlatform(Platform platform) {
    _platform = platform;
  }

  Future<String?> getTemporaryPath() {
    return methodChannel.invokeMethod<String>('getTemporaryDirectory');
  }

  Future<String?> getApplicationSupportPath() {
    return methodChannel.invokeMethod<String>('getApplicationSupportPath');
  }

  Future<String?> getLibraryPath() {
    if (!_platform.isIOS && !_platform.isMacOS) {
      throw UnsupportedError('Functionality only available on iOS/macOS');
    }
    return methodChannel.invokeMethod<String>('getLibraryPath');
  }

  Future<String?> getApplicationDocumentsPath() {
    return methodChannel.invokeMethod<String>('getApplicationDocumentsPath');
  }

  Future<String?> getExternalStoragePath() {
    if (!_platform.isAndroid) {
      throw UnsupportedError('Functionality only available on Android');
    }
    return methodChannel.invokeMethod<String>('getExternalStoragePath');
  }

  Future<List<String>?> getExternalCachePaths() {
    if (!_platform.isAndroid) {
      throw UnsupportedError('Functionality only available on Android');
    }
    return methodChannel.invokeMethod<List<String>>('getExternalCachePaths');
  }

  Future<List<String>?> getExternalStoragePaths({StorageDirectory? type}) {
    if (!_platform.isAndroid) {
      throw UnsupportedError('Functionality only available on Android');
    }
    return methodChannel.invokeListMethod<String>(
        'getExternalStoragePaths', <String, dynamic>{'type': type?.index});
  }

  Future<String?> getDownloadsPath() {
    if (!_platform.isMacOS) {
      throw UnsupportedError('Functionality only available on macOS');
    }
    return methodChannel.invokeMethod<String>('getDownloadsPath');
  }

  Future<String?> getRootPath() {
    if (!_platform.isWindows && !_platform.isLinux && !_platform.isMacOS) {
      throw UnsupportedError(
          'Functionality only available on windows, linux or macOS');
    }
    return methodChannel.invokeMethod('getRootPath');
  }
}
