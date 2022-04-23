apt-get install snapd
snap install core
snap install lxd
snap list
snap restart lxd
lxd init
lxc list
lxc launch ubuntu:20.04 LTS test-container #version likhna ubuntu ka jo launch karna aur saath container ka name
lxc exec test-container bash\
lxc config device add ${SERVER}:$APP_CONTAINER proxyport$PORT proxy listen=tcp:0.0.0.0:$PORT connect=tcp:127.0.0.1:$PORT
lxc config device add proxy-server-new myport443 proxy listen=tcp:0.0.0.0:443 connect=tcp:127.0.0.1:443
server {
        listen 80 proxy_protocol;
        listen [::]:80 proxy_protocol;
        server_name ta.faisal.ga;
        location / {
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_pass http://nginx-server1.lxd;
        }
        real_ip_header proxy_protocol;
        set_real_ip_from 127.0.0.1;
}
