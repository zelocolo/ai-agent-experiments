#!/bin/bash
# Auto Briefing - 每日技术简报生成器
set -e
CITY="${1:-Shanghai}"
DATE=$(date +%Y-%m-%d)

echo "🌅 每日技术简报 — $DATE"
echo ""

# GitHub Top 5
echo "📊 GitHub 今日热门 Top 5:"
curl -s "https://api.github.com/search/repositories?q=pushed:>$(date -d '1 day ago' +%Y-%m-%d)+stars:>100&sort=stars&order=desc&per_page=5" | python3 -c "
import json,sys
for i,r in enumerate(json.load(sys.stdin).get('items',[])[:5],1):
    desc=r.get('description','')[:60]
    print(f\"{i}. {r['full_name']} ⭐{r['stargazers_count']}\")
    print(f\"   {desc}\")
    print(f\"   {r['html_url']}\")
    print()
" 2>/dev/null || echo "  (获取失败)"

echo "💡 今日金句:"
QUOTES=("代码是写给人看的，顺便让机器执行。" "Talk is cheap. Show me the code." "先让它跑起来，再让它跑得好。" "最好的代码是没有代码。" "编程是一门手艺，不是科学。")
RANDOM_Q=${QUOTES[$RANDOM % ${#QUOTES[@]}]}
echo "  \"$RANDOM_Q\""
