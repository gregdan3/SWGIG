#!/bin/bash
BLOGDIR=pages/blog

POSTS=$(find "$BLOGDIR"/*.md)


RETURNDATE=""

function getdate {
    FILEDATE=$(grep "^date: " "$1" | cut -d ' ' -f 2 | cut -d 'T' -f 1)
    RETURNDATE=$(date -u --date="$FILEDATE" "+%s")
}

echo -n >blogdates.txt
for f in ${POSTS[@]}; do
    getdate "$f"
    printf "%d\t%s\n" "$RETURNDATE" "$f" >>blogdates.txt
done

POSTS=$(sort -nr <blogdates.txt | cut -f 2-)

cat templates/blog_header.md
echo ""

for f in ${POSTS[@]}; do
    getdate "$f"
    MTIME=$RETURNDATE
    TITLE=$(grep "^title: " "$f" | cut -d ' ' -f 2-)

    OUTPAGE=${f%.md}.html
    OUTPAGE=${OUTPAGE#"${BLOGDIR}/"}

    echo -e "::: blogentry\n"
    echo -e "[[$TITLE]($OUTPAGE)]{.bloglink} ($(date -d "@$MTIME" "+%Y-%m-%d"))"

    PREAMBLE=$(sed '/^<!-- preamble -->$/Q' "$f" | grep -v '^$')
    if [[ $(echo "$PREAMBLE" | wc -l) -lt 8 ]]; then
        CLEANED=$(echo "$PREAMBLE" | tail -n1)
        echo -e "\n[$CLEANED]{.blogpreamble}"
    fi
    echo -e "\n:::\n"
done

rm blogdates.txt
