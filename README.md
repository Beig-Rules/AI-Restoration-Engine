# 🚀 AI Restoration Engine

**Production-oriented, offline-first, memory-safe AI image restoration platform for Android.**

Restore old, blurry, compressed or damaged photos using a multi-stage adaptive pipeline  
(deblock → denoise → super-resolution → face restoration → post-processing).

---

## ✨ Features

| Feature | Status |
|---------|--------|
| Pure Kotlin domain layer (zero Android deps) | ✅ |
| Rule-based adaptive pipeline planner | ✅ |
| Native C++ tile engine + AddressSanitizer | ✅ |
| Structured concurrency + cooperative cancellation | ✅ |
| Sealed `EngineError` with recovery recommendations | ✅ |
| Jetpack Compose multi-module UI | ✅ |
| Offline-only by design | ✅ |
| Unit + fuzz + benchmark harnesses | ✅ |
| Privacy-first (no network upload) | ✅ |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────┐
│  android/app + feature/{home,editor,result,settings}    │  Compose UI
├─────────────────────────────────────────────────────────┤
│  android/core/{ui, domain, engine-android}              │  Theme + JNI Bridge
├─────────────────────────────────────────────────────────┤
│  engine/  (pure JVM)                                    │  Domain + Planner + Pipeline
├─────────────────────────────────────────────────────────┤
│  native/  (C++ / CMake / JNI)                           │  Tile engine + ASan
└─────────────────────────────────────────────────────────┘
```

See `docs/adr/` for Architecture Decision Records.

---

## ▶️ Getting Started

### Prerequisites
- Android Studio Hedgehog (2023.1+) or newer
- JDK 17
- Android SDK 34
- CMake 3.22+ (for native module)

### Open & Run
1. Clone the repository
2. Open the **root folder** in Android Studio
3. Let Gradle sync
4. Select run configuration `android.app`
5. Run on emulator or device (minSdk 24)

### Tests
```bash
python3 tests/unit/test_planner.py
python3 tests/fuzz/fuzz_decoder.py
python3 benchmarks/run_benchmark.py

# Full suite (requires Gradle environment)
chmod +x scripts/*.sh
./scripts/run_tests.sh
```

### Release build
```bash
./scripts/build_release.sh
```

---

## 🧠 Pipeline Logic

1. **ANALYZE** – produce `ImageQualityProfile`
2. **RuleBasedPipelinePlanner** selects stages based on quality metrics
3. Progress emitted as `RestoreProgress`
4. Cancellation is cooperative

---

## 📦 Current Status / Roadmap

| Phase | Content | Status |
|-------|---------|--------|
| 0–4 | Domain, Planner, Pipeline, Native skeleton | ✅ |
| 5 | Compose UI (Home / Editor / Result / Settings) | ✅ |
| 6 | Tests, fuzz, benchmarks | ✅ |
| 7 | Docs, licenses, privacy policy | ✅ |
| 8 | ProGuard, release scripts, checklist | ✅ |
| Next | Real ONNX / TFLite models + inference | 🔜 |
| Next | Before/After comparison slider | 🔜 |
| Next | GPU / NPU backends | 🔜 |

---

## 📜 License

See `licenses/`. Project may be released under Apache-2.0 or MIT.
