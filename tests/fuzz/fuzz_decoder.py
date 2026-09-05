import os
import random

def generate_corrupt_images(output_dir, count=10):
    os.makedirs(output_dir, exist_ok=True)
    for i in range(count):
        path = os.path.join(output_dir, f"corrupt_{i}.jpg")
        size = random.randint(0, 1024)
        data = bytes([random.randint(0, 255) for _ in range(size)])
        with open(path, 'wb') as f: f.write(data)
    print(f"✅ Generated {count} corrupt images in {output_dir}")

if __name__ == "__main__":
    generate_corrupt_images("tests/fuzz/outputs")
