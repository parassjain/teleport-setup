
# Teleport deployment manual

i m pretty much copying the documentation present on teelport website with just better summary https://goteleport.com/docs/try-out-teleport/linux-server/

Setting up a teleport on cloud for require 3 things

## Pre-requisite

- a domain name. in my case i m taking [paras.cloud](paras.cloud) as my main domain and i m setting up teleport host on [tele.paras.cloud](https://tele.paras.cloud)
- host server on any cloud(aws/gcp/etc.). here my server's public ip is [13.233.213.24]()
- machine which you want to add as tunnel/application access


## DNS settings on your host provider

- Set up two A DNS records: [tele.paras.cloud]() for all traffic and [*.tele.paras.cloud]() for web apps using application access. We are assuming that your domain name is example.com. Use your own subdomain instead of tele.

below is my dns settings example
![App Screenshot](https://raw.githubusercontent.com/prsjn/teleport-setup/master/img/DNS_settings.png)
## Installation on host server

Installation is easy peasy

first we will install teleport on this host server.

Refer this [link](https://goteleport.com/docs/try-out-teleport/linux-server/#step-36-set-up-teleport-on-your-linux-host) or follow the below steps.

```bash
sudo curl https://apt.releases.teleport.dev/gpg -o /usr/share/keyrings/teleport-archive-keyring.asc
source /etc/os-release
echo "deb [signed-by=/usr/share/keyrings/teleport-archive-keyring.asc] https://apt.releases.teleport.dev/${ID?} ${VERSION_CODENAME?} stable/v12" | sudo tee /etc/apt/sources.list.d/teleport.list > /dev/null

sudo apt-get update
sudo apt-get install teleport
```



now its time to start the teleport host service
execute the below command on the host server
```
sudo teleport configure --acme --acme-email=user@example.com --cluster-name=tele.example.com | \
sudo tee /etc/teleport.yaml > /dev/null
```

start the service
```
sudo systemctl enable teleport
sudo systemctl start teleport
```

your teleport should new be visible on [tele.paras.cloud]()