import 'dart:async';

import 'src/enums.dart';
import 'src/method_channel_path_provider.dart';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class PathProviderPlatform extends PlatformInterface {
  PathProviderPlatform() : super(token: _token);

  static final Object _token = Object();

  static PathProviderPlatform _instance = MethodChannelPathProvider();

  static PathProviderPlatform get instance => _instance;

  static set instance(PathProviderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> getTemporaryPath() {
    throw UnimplementedError('getTemporaryPath() has not been implemented');
  }

  Future<String> getApplicationSupportPath() {
    throw UnimplementedError(
        'getApplicationSupportPath() has not been implemented');
  }

  Future<String> getLibraryPath() {
    throw UnimplementedError('getLibraryPath() has not been implemented');
  }

  Future<String> getApplicationDocumentsPath() {
    throw UnimplementedError(
        'getApplicationDocumentsPath() has not been implemented');
  }

  Future<String> getExternalStoragePath() {
    throw UnimplementedError(
        'getExternalStoragePath() has not been implemented');
  }

  Future<List<String>> getExternalCachePaths() {
    throw UnimplementedError(
        'getExternalCachePaths() has not been implemented');
  }

  Future<List<String>> getExternalStoragePaths({
    StorageDirectory type,
  }) {
    throw UnimplementedError(
        'getExternalStoragePaths() has not been implemented');
  }

  Future<String> getDownloadsPath() {
    throw UnimplementedError('getDownloadsPath() has not been implemented');
  }

  Future<String> getRootPath() {
    throw UnimplementedError('getRootPath() has not been implemented');
  }
}
