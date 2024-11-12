#!/bin/bash

# URL of the GitHub repository ZIP
ZIP_URL="https://github.com/golang/go/archive/refs/heads/master.zip"
# The directory path inside the ZIP to extract
TARGET_DIR="go-master/src/encoding/json"
# Temporary file to store the downloaded ZIP
TEMP_ZIP="master.zip"
# Temporary directory for extracting the ZIP
TEMP_DIR="temp_extract"

# Download the ZIP file
echo "Downloading ZIP file..."
curl -L -o "$TEMP_ZIP" "$ZIP_URL"

# Extract only the target directory from the ZIP into a temporary directory
echo "Extracting $TARGET_DIR..."
mkdir -p "$TEMP_DIR"
unzip "$TEMP_ZIP" "$TARGET_DIR/*" -d "$TEMP_DIR"

# Move the contents of the extracted target directory to the current directory
echo "Moving contents from $TARGET_DIR to the current directory..."
mv "$TEMP_DIR/$TARGET_DIR/"* .

# Clean up temporary files and directories
rm -rf "$TEMP_ZIP" "$TEMP_DIR"

echo "Extraction complete!"
