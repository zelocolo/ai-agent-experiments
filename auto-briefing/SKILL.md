---
name: auto-briefing
description: 自动生成每日简报，包含 GitHub 热门项目、天气、新闻摘要。可配置为每天定时推送。当用户说"每日简报"、"早报"、"daily briefing"时触发。
---

# Auto Briefing

一键生成每日技术简报，自动推送到指定渠道。

## 功能

- 📊 GitHub 热门项目 Top 5
- 🌤️ 天气信息
- 📰 技术新闻摘要
- ⏰ 支持定时推送（cron）

## 使用

```bash
bash <skill_dir>/scripts/briefing.sh [城市名]
```

## 配置定时推送

```bash
openclaw cron add \
  --name "Daily Briefing" \
  --cron "0 8 * * *" \
  --tz "Asia/Shanghai" \
  --session isolated \
  --message "运行每日简报脚本并发送给用户" \
  --announce \
  --channel qqbot \
  --to "qqbot:c2c:YOUR_CHAT_ID"
```

## 输出格式

```
🌅 每日技术简报 — 2026-03-28

🌤️ 天气：上海 晴 18°C

📊 GitHub 今日热门 Top 5:
1. owner/repo ⭐12345
   项目描述...
   https://github.com/owner/repo

📰 技术新闻:
- 新闻标题1
- 新闻标题2

💡 今日金句: "代码是写给人看的，顺便让机器执行。"
```
