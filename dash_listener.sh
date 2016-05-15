while true; do
        netcat -vv -l -p 443 -c < /www/error.html
        curl -X POST http://maker.ifttt.com/trigger/YOUR_ACTION/with/key/YOUR_KEY
        sleep 5
done
