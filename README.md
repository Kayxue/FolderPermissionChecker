# folder_permission_checker

A simple package for checking whether a folder is readonly or writable

> [!WARNING]
> This package hasn't been tested on other OS except MacOS, if you facing any problems, please open an issue.

## Prerequisite

Please make sure you have Rust compiler installed

## Compability

Worked on MacOS, but haven't tested on other OS yet.

And for Android, maybe you need to give externel storage read/write permission for the package to work.

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