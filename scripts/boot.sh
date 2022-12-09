#!/bin/sh

echo ""
echo ""
echo "╭━━━━╮╱╱╱╱╭╮╱╭╮╱╱╱╱╱╱╭━━╮╭━━━┳━━━━╮"
echo "┃╭╮╭╮┃╱╱╱╭╯╰┳╯╰╮╱╱╱╱╱┃╭╮┃┃╭━╮┃╭╮╭╮┃"
echo "╰╯┃┃┣┫╭╮╭╋╮╭┻╮╭╋━━┳━╮┃╰╯╰┫┃╱┃┣╯┃┃╰╯"
echo "╱╱┃┃┃╰╯╰╯┣┫┃╱┃┃┃┃━┫╭╯┃╭━╮┃┃╱┃┃╱┃┃"
echo "╱╱┃┃╰╮╭╮╭┫┃╰╮┃╰┫┃━┫┃╱┃╰━╯┃╰━╯┃╱┃┃"
echo "╱╱╰╯╱╰╯╰╯╰┻━╯╰━┻━━┻╯╱╰━━━┻━━━╯╱╰╯"
echo ""
echo ""


if [ -z "$TWITTER_CONSUMER_KEY" ] || [ -z "$TWITTER_CONSUMER_SECRET" ] || [ -z "$TWITTER_TOKEN" ] || [ -z "$TWITTER_SECRET" ] || [ -z "$TWITTER_LINE_NOTIFY_TOKEN" ]; then
    echo "Twitter API tokens are not set."
    echo ""

    echo "================== List of API Tokens =================="
    echo ""
    echo "CONSUMER_KEY=$TWITTER_CONSUMER_KEY"
    echo "CONSUMER_SECRET=$TWITTER_CONSUMER_SECRET"
    echo "TOKEN=$TWITTER_TOKEN"
    echo "SECRET=$TWITTER_SECRET"
    echo "LINE_NOTIFY_TOKEN=$TWITTER_LINE_NOTIFY_TOKEN"
    echo ""
    echo " ======================================================="

    echo ""
    echo "Twitter BOT is not activated."

    exit 1
fi

echo "Twitter BOT successfully activated."

dart run bin/example.dart -k "$TWITTER_CONSUMER_KEY" -c "$TWITTER_CONSUMER_SECRET" -t "$TWITTER_TOKEN" -s "$TWITTER_SECRET" -l "$TWITTER_LINE_NOTIFY_TOKEN"
