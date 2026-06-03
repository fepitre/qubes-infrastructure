/usr/local/etc/qubes-rpc/local.ConnectSSH:
  file.managed:
    - contents:
      - "#!/bin/sh"
      - 'host="${1%+*}"'
      - 'port="${1##*+}"'
      - 'exec /bin/socat - TCP:"$host":"$port"'
    - mode: 0755
    - makedirs: True
