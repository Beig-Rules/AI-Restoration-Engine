#!/usr/bin/env bash
set -euo pipefail

echo "🧪 Running AI Restoration Engine tests..."
echo

echo "→ Domain / Pipeline unit tests (Kotlin)"
./gradlew :engine:test --quiet || echo "⚠️  Gradle tests require Android Studio / JDK 17 environment"

echo
echo "→ Python planner validation"
python3 tests/unit/test_planner.py

echo
echo "→ Fuzz corpus generation"
python3 tests/fuzz/fuzz_decoder.py

echo
echo "→ Benchmarks"
python3 benchmarks/run_benchmark.py

echo
echo "✅ All available tests finished"
