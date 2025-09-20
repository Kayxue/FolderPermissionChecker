# folder_permission_checker

A simple package for checking whether a folder is readonly or writable

> [!WARNING]
> This file is not finished

## Prerequisite

Please make sure you have Rust compiler installed

## Compability

Worked on MacOS, haven't tested on other OS yet.

## Usage
First, you need to initialize the module:
```dart
Future<void> main() async {
  await FolderPermissionChecker.init();     //Add this line
  runApp(const MyApp());
}
```

Then you can use this module like this.

```dart
bool isReadonly = await FolderPermissionChecker.isReadonly('/some/path/or/file');
print(isReadonly);
```

```dart
bool isWritable = await FolderPermissionChecker.isDirectoryWritable("/some/path");
print(isWritable);
```

You can see real Flutter usage example in example folder.

## Contribution
Welcome to contribute to this project. Feel free to open an issue or submit a pull request.