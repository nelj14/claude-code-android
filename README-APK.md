# Claude Code Android APK

This project creates an Android APK for Claude Code using Capacitor.

## Project Structure

```
claude-code-android/
├── www/                    # Web interface (terminal UI)
│   └── index.html         # Main terminal interface
├── configuration/         # Claude Code settings
│   └── settings.json     # API configuration
├── capacitor.config.json # Capacitor configuration
├── package.json          # Dependencies
└── android/              # Android platform (generated)
```

## Features

- **Terminal Interface**: Web-based terminal emulator
- **Claude Integration**: Configured for Trend Micro AI endpoint
- **Mobile Optimized**: Touch-friendly interface
- **Offline Ready**: Basic terminal works without network

## Build Instructions

### Prerequisites
- Android SDK or Android Studio
- Node.js (already installed)
- Java Development Kit (JDK)

### Build Steps

1. **Setup Android Platform**:
   ```bash
   node node_modules/@capacitor/cli/bin/capacitor add android
   ```

2. **Copy Web Assets**:
   ```bash
   node node_modules/@capacitor/cli/bin/capacitor copy android
   ```

3. **Build APK**:
   ```bash
   cd android
   ./gradlew assembleDebug
   ```

### Alternative: Android Studio

1. Open the `android` directory in Android Studio
2. Build → Generate Signed Bundle/APK
3. Choose APK
4. Select debug or release build

## Current Limitations

- **Simulated Terminal**: The current interface is a demo
- **No Real Claude Integration**: Backend integration needed
- **Basic Functionality**: Limited to web-based terminal emulation

## Next Steps for Full Integration

1. **Add Node.js Runtime**: Integrate Node.js in Android app
2. **Claude Code Backend**: Run actual Claude Code in app
3. **File System Access**: Enable file operations
4. **Terminal Emulation**: Add real terminal capabilities

## Usage

Once installed, the APK will:
1. Open with a terminal interface
2. Auto-start Claude Code simulation
3. Accept basic commands (help, clear, exit)
4. Provide a foundation for full Claude Code integration

## Configuration

The app uses settings from `configuration/settings.json`:
- Custom API endpoint (Trend Micro)
- Authentication token
- Model selection (claude-4-sonnet)

This setup provides a starting point for a Claude Code mobile app that can be enhanced with full terminal and Claude Code functionality.