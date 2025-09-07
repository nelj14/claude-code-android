#!/bin/bash

echo "Claude Code APK Builder"
echo "======================"

# Check if we're in the right directory
if [ ! -f "capacitor.config.json" ]; then
    echo "Error: Not in a Capacitor project directory"
    exit 1
fi

# Check if web directory exists
if [ ! -d "www" ]; then
    echo "Error: www directory not found"
    exit 1
fi

echo "✓ Project structure verified"

# Try to rebuild the Android platform
echo "Setting up Android platform..."

# Remove existing android directory if it exists
rm -rf android 2>/dev/null

# Add Android platform
node node_modules/@capacitor/cli/bin/capacitor add android

if [ $? -eq 0 ]; then
    echo "✓ Android platform added successfully"
else
    echo "⚠ Android platform setup had issues, but continuing..."
fi

# Try to copy web assets manually
echo "Copying web assets..."
mkdir -p android/app/src/main/assets/public 2>/dev/null
cp -r www/* android/app/src/main/assets/public/ 2>/dev/null

if [ -f "android/app/src/main/assets/public/index.html" ]; then
    echo "✓ Web assets copied successfully"
else
    echo "⚠ Web assets copy failed - this may affect the APK"
fi

# Try to sync
echo "Syncing project..."
node node_modules/@capacitor/cli/bin/capacitor sync android 2>/dev/null

echo ""
echo "Build setup complete!"
echo ""
echo "To build the APK manually:"
echo "1. Install Android Studio"
echo "2. Open the 'android' directory in Android Studio"
echo "3. Build -> Generate Signed Bundle/APK"
echo ""
echo "Or if you have Android SDK command line tools:"
echo "cd android && ./gradlew assembleDebug"
echo ""
echo "The APK will contain a terminal interface that simulates Claude Code."
echo "For full functionality, you'll need to integrate with the actual Claude Code backend."