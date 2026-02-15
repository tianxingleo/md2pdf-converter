#!/bin/bash
# quick-start.sh
# md2pdf-converter 快速开始脚本

echo "🎉 md2pdf-converter 快速开始"
echo ""

# 检查依赖
echo "📦 检查依赖..."
if ! command -v pandoc &> /dev/null; then
    echo "❌ Pandoc 未安装，请先安装："
    echo "   sudo apt-get install pandoc"
    exit 1
fi

if ! command -v weasyprint &> /dev/null; then
    echo "❌ WeasyPrint 未安装，请先安装："
    echo "   sudo apt-get install python3-weasyprint"
    exit 1
fi

if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 未安装"
    exit 1
fi

echo "✅ 所有依赖已安装"
echo ""

# 获取脚本目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "📝 使用示例："
echo ""
echo "1. 转换单个文件："
echo "   bash scripts/md2pdf-local.sh examples/simple.md output.pdf"
echo ""
echo "2. 批量转换："
echo "   for file in examples/*.md; do"
echo "     bash scripts/md2pdf-local.sh \"\$file\" \"\${file%.md}.pdf\""
echo "   done"
echo ""
echo "3. 测试 emoji："
echo "   bash scripts/md2pdf-local.sh examples/emoji.md emoji-test.pdf"
echo ""
echo "💡 首次运行会下载 ~150MB 的 Twemoji 资源（10-30秒）"
echo "   后续运行将完全离线，秒级转换"
echo ""
echo "🚀 开始转换！"
echo ""
