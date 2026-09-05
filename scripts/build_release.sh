#!/usr/bin/env bash
set -euo pipefail

echo "📦 Building release AAB / APK..."
./gradlew clean
./gradlew :android:app:bundleRelease :android:app:assembleRelease

echo
echo "✅ Artifacts:"
find android/app/build/outputs -name "*.aab" -o -name "*.apk" 2>/dev/null || echo "   (run inside Android Studio / with Gradle wrapper)"
