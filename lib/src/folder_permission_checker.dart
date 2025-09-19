import 'rust/frb_generated.dart';
import 'rust/api/core.dart' as core;

class FolderPermissionChecker {
  FolderPermissionChecker._();

  /// Initializes the library.
  static Future<void> init() async {
    await RustLib.init();
  }

  /// Checks whether the file or folder specified by `path` is read-only.
  /// If the path does not exist, or there are other IO issues, an error is thrown.
  static Future<bool> isReadonly(String path) async => await core.isReadonly(path);

  /// Checks whether the directory specified by `path` is writable.
  /// Throws an error if the path does not exist, not a directory, or there are other IO issues.
  static Future<bool> isDirectoryWritable(String path) async =>
      await core.isDirectoryWritable(path);
}
