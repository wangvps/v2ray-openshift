#!/bin/sh
# V2Ray new configuration
cat <<-EOF > /etc/v2ray/config.json

{
  "inbounds": [{
    "port": 6899,           
    "listen":"127.0.0.1",
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "ee2f35c2-750c-4aab-99b4-45c0bf683caa", 
          "level": 1,
          "alterId": 0
        }
      ]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
        "path": "/laowang"   
      }
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  },{
    "protocol": "blackhole",
    "settings": {},
    "tag": "blocked"
  }],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": ["geoip:private"],
        "outboundTag": "blocked"
      }
    ]
  }
}
EOF
# Run V2Ray
/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
