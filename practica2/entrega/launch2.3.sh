wget -q \
  "https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/nginx_logs/nginx_logs" \
  -O ./data/access.log
wc -l ./data/access.log
