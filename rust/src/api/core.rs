use anyhow::Result;
use std::{fs, io::Error, path::Path};

#[flutter_rust_bridge::frb(positional)]
pub fn is_readonly(path: String) -> Result<bool, Error> {
    let metadata = fs::metadata(path)?;
    let permissions = metadata.permissions();
    return Ok(permissions.readonly());
}

#[flutter_rust_bridge::frb(positional)]
pub fn is_directory_writable(path: String) -> Result<bool> {
    let metadata = fs::metadata(&path)?;
    if !metadata.is_dir() {
        return Err(Error::new(std::io::ErrorKind::Other, "Path is not a directory").into());
    }
    let path = Path::new(&path);
    let test_file = path.join("temp_test_file");
    match fs::File::create(&test_file) {
        Ok(_) => {
            fs::remove_file(test_file)?;
            Ok(true)
        }
        Err(_) => Ok(false),
    }
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
