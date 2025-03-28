#!/bin/sh

echo "Content-Type: text/html"
echo ""

echo "<!DOCTYPE html>"
echo "<html><head>"
echo "<title>文件下载</title>"
echo "<meta charset='utf-8'>"
echo "<style>"
echo "body { font-family: Arial, sans-serif; margin: 20px; }"
echo "table { border-collapse: collapse; width: 100%; }"
echo "th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }"
echo "th { background-color: #f2f2f2; }"
echo "a { text-decoration: none; color: blue; }"
echo "a:hover { text-decoration: underline; }"
echo "</style>"
echo "</head><body>"
echo "<h1>文件下载</h1>"

# 显示日志文件列表
echo "<h2>日志文件</h2>"
echo "<table>"
echo "<tr><th>文件名</th><th>大小</th><th>修改时间</th><th>操作</th></tr>"
for file in /var/log/*.log; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        size=$(ls -lh "$file" | awk '{print $5}')
        mtime=$(ls -l "$file" | awk '{print $6, $7, $8}')
        echo "<tr><td>$filename</td><td>$size</td><td>$mtime</td><td><a href='/logs/$filename'>下载</a></td></tr>"
    fi
done
echo "</table>"

# 显示上传文件列表
echo "<h2>上传的文件</h2>"
echo "<table>"
echo "<tr><th>文件名</th><th>大小</th><th>修改时间</th><th>操作</th></tr>"
for file in /var/www/uploads/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        size=$(ls -lh "$file" | awk '{print $5}')
        mtime=$(ls -l "$file" | awk '{print $6, $7, $8}')
        echo "<tr><td>$filename</td><td>$size</td><td>$mtime</td><td><a href='/uploads/$filename'>下载</a></td></tr>"
    fi
done
echo "</table>"

echo "</body></html>" 