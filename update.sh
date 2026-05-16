#!/bin/bash

echo "🚀 BAT DAU CAP NHAT K37REPO..."
cd /var/mobile/K37Repo

echo "🧹 Dang xoa cac file Packages cu..."
rm -f Packages Packages.bz2 Packages.zst

echo "📦 Dang quet cac file .deb (Cho xiu nhe)..."
# Lưu ý: Nếu file deb để thẳng ở ngoài thì đổi "./debs" thành "." nhé
dpkg-scanpackages -m ./debs > Packages

echo "🗜 Dang nen file sang chuan bz2 va zstd..."
bzip2 -fk Packages
zstd -c19 Packages > Packages.zst

echo "☁️ Dang day code len GitHub..."
git add .
git commit -m "Auto Update Repo qua Bash Script"
git push

echo "✅ XONG! TOAN BO TWEAK DA UPLOAD LEN SILEO!"