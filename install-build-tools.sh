#!/bin/bash

echo "Installing Android build tools in Termux..."

# Install OpenJDK
pkg update
pkg install openjdk-17

# Install Gradle (if available)
pkg install gradle

# Set JAVA_HOME
export JAVA_HOME=/data/data/com.termux/files/usr/opt/openjdk
echo "export JAVA_HOME=/data/data/com.termux/files/usr/opt/openjdk" >> ~/.bashrc

# Install Android SDK command line tools
mkdir -p $HOME/android-sdk/cmdline-tools
cd $HOME/android-sdk/cmdline-tools

# Download Android command line tools
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip commandlinetools-linux-9477386_latest.zip
mv cmdline-tools latest

# Set environment variables
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

echo "export ANDROID_HOME=$HOME/android-sdk" >> ~/.bashrc
echo "export PATH=\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin:\$ANDROID_HOME/platform-tools" >> ~/.bashrc

# Install build tools and platform
yes | sdkmanager "build-tools;33.0.0" "platforms;android-33"

echo "Build tools installed! Restart Termux and try building."