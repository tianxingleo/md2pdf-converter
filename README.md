# md2pdf-converter

> 离线 Markdown 到 PDF 转换器，支持完整 Unicode、中文字体和 3660 个彩色 emoji（包含所有变体）

## 🚀 快速开始

### 安装

```bash
# 通过 ClawHub 安装
clawhub install md2pdf-converter

# 或从 GitHub 克隆
git clone https://github.com/tianxingleo/md2pdf-converter.git
cd md2pdf-converter
```

### 基础使用

```bash
# 转换 Markdown 文件为 PDF
bash scripts/md2pdf-local.sh input.md output.pdf

# 示例
bash scripts/md2pdf-local.sh README.md README.pdf
```

## ✨ 特性

- 🌐 **完整 Unicode 支持** - 中文、日文、韩文等
- 😊 **彩色 Emoji 支持** - Twemoji 14.0.0，3660 个彩色 PNG
- 🎨 **所有 Emoji 变体** - 肤色、发型、区域标识符等
- 📱 **离线运行** - 首次下载后完全离线工作
- 📄 **专业 PDF 布局** - 页码、代码高亮、表格、引用块
- 🇨🇳 **中文字体优化** - AR PL UMing CN 等

## 📦 依赖

### 必需依赖

- **Python 3.6+** - 用于 emoji 映射表生成
- **Pandoc** - Markdown 到 HTML 转换
- **WeasyPrint** - HTML 到 PDF 渲染
- **wget** - 首次运行下载 emoji 资源

### 安装依赖

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install python3 python3-pip pandoc weasyprint wget
```

**macOS:**
```bash
brew install python3 pandoc weasyprint wget
pip3 install weasyprint
```

**字体安装（中文支持）：**
```bash
# Ubuntu/Debian
sudo apt-get install fonts-arphic-uming

# 验证安装
fc-list | grep "AR PL UMing"
```

## 🔧 首次运行

首次运行时，脚本会自动：

1. **下载 Twemoji**（约 150MB）
2. **生成 emoji 映射表**
3. **缓存到本地**

```bash
bash scripts/md2pdf-local.sh your-file.md output.pdf
# 输出：
# 🚧 正在设置 Twemoji 14.0.0...
#    下载 Twemoji...
#    解压 Twemoji...
#    生成 emoji 映射表...
# ✅ Twemoji 完整版已准备就绪
# ✅ Emoji 资源已缓存至: ~/.cache/md2pdf/emojis
```

后续运行将完全离线，秒级转换！

## 📊 Emoji 支持

### 支持的 Emoji

- ✅ 所有基本 emoji（😀、🎉、✨ 等）
- ✅ 肤色变体（🙋🏻、🙋🏼、🙋🏽）
- ✅ 发型变体
- ✅ 区域标识符
- ✅ 其他组合变体（🌚、🌛、🌜）
- ✅ 总计：**3660 个**（包含所有变体）

### Twemoji 版本

- **版本**: 14.0.0
- **来源**: Twitter Twemoji
- **数量**: 3660 个 PNG
- **大小**: 72x72 像素
- **样式**: 彩色、扁平化设计

## 📝 使用示例

### 基础转换

```bash
# 转换单个文件
bash scripts/md2pdf-local.sh document.md document.pdf

# 转换目录下所有 Markdown
for file in *.md; do
    bash scripts/md2pdf-local.sh "$file" "${file%.md}.pdf"
done
```

### 批量转换脚本

```bash
#!/bin/bash
# batch-convert.sh
# 批量转换 Markdown 文件为 PDF

for md_file in *.md; do
    pdf_file="${md_file%.md}.pdf"
    echo "转换 $md_file -> $pdf_file"
    bash scripts/md2pdf-local.sh "$md_file" "$pdf_file"
done
```

## 🔍 目录结构

```
md2pdf-converter/
├── SKILL.md                    # Skill 文档
├── README.md                   # 项目说明（本文件）
├── requirements.txt             # Python 依赖
├── scripts/
│   ├── md2pdf-local.sh        # 主转换脚本
│   └── generate_emoji_mapping.py  # Emoji 映射表生成器
└── examples/                   # 示例文件
    ├── simple.md              # 简单示例
    ├── chinese.md             # 中文示例
    └── emoji.md               # Emoji 测试
```

## 🎯 高级用法

### 自定义缓存位置

```bash
# 修改缓存目录（在脚本中）
CACHE_DIR="/custom/cache/path"
EMOJI_DIR="$CACHE_DIR/emojis"
```

### 调试模式

```bash
# 查看转换后的 HTML
bash scripts/md2pdf-local.sh input.md output.html
# 然后手动使用 WeasyPrint 转换
weasyprint temp.html output.pdf
```

## 🐛 故障排除

### Emoji 显示问题

**问题**: Emoji 仍然显示为黑白字符

**解决方案**:
```bash
# 1. 检查是否使用 v2.0 脚本
grep "TWEMOJI_VERSION" scripts/md2pdf-local.sh

# 2. 清理并重新生成缓存
rm -rf ~/.cache/md2pdf
bash scripts/md2pdf-local.sh test.md test.pdf
```

### 中文字体问题

**问题**: 中文字符显示不正确

**解决方案**:
```bash
# 检查字体是否安装
fc-list | grep "AR PL UMing"

# 安装字体
sudo apt-get install fonts-arphic-uming

# 验证
fc-cache -fv
```

### WeasyPrint 错误

**问题**: WeasyPrint 命令未找到

**解决方案**:
```bash
# 通过 pip 安装
pip3 install weasyprint

# 或使用系统包管理器
sudo apt-get install python3-weasyprint
```

## 📈 性能

- **首次运行**: ~150MB 下载，10-30 秒
- **后续运行**: 完全离线，1-5 秒/页
- **内存占用**: ~150MB（emoji 缓存）
- **PDF 生成**: 1-3 秒/页（取决于内容复杂度）

## 🆚 版本历史

### v2.0.0 (当前)
- ✅ 切换到 Twemoji 14.0.0 完整版
- ✅ 支持 3660 个彩色 emoji
- ✅ Python 预生成映射表
- ✅ 修复黑白 emoji 显示问题
- ✅ 支持所有 emoji 变体

### v1.0.0
- 初始版本
- 使用 emoji-datasource-google (~2000-3000 个 emoji)
- 简单 hex-based 文件名匹配

## 📄 许可证

MIT License - 自由使用和修改

## 🔗 相关链接

- **ClawHub**: https://clawhub.com/skills/md2pdf-converter
- **GitHub**: https://github.com/tianxingleo/md2pdf-converter
- **Twemoji**: https://github.com/twitter/twemoji
- **Pandoc**: https://pandoc.org
- **WeasyPrint**: https://weasyprint.org

## 💡 提示

1. **首次运行需要网络** - 下载 emoji 资源
2. **后续完全离线** - 不需要任何网络连接
3. **缓存自动管理** - 无需手动维护
4. **支持增量更新** - 可随时更新 Twemoji 版本
5. **兼容性** - 与标准 Markdown 完全兼容

---

**Made with ❤️ and Twemoji 14.0.0**
