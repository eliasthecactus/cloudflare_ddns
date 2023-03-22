
<h1 align="left">Cloudflare DDNS</h1>
<p>
  <a href="https://github.com/eliasthecactus/cloudflare_ddns#readme" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="https://github.com/eliasthecactus/cloudflare_ddns/graphs/commit-activity" target="_blank">
    <img alt="Maintenance" src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" />
  </a>
  <img alt="Version: v1.0.0-alpha1" src="https://img.shields.io/badge/version-v1.0.0--alpha1-blue" />
  <a href="https://github.com/eliasthecactus/cloudflare_ddns/blob/main/LICENSE" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/github/license/eliasthecactus/cloudflare_ddns" />
  </a>
</p>

> 😋 A simple Bash script to update cloudflares dns entry with your current IP

## Create API-Key
1) Click Create Token
2) Select Create Custom Token
3) Provide the token a name, for example, example.com-dns-zone-readonly
4) Grant the token the following permissions:
5) Zone - DNS - Edit
6) Set the zone resources to:
7) Include - Specific Zone - example.com
8) Complete the wizard and use the generated token at the CLOUDFLARE_API_TOKEN variable for the container
```

## Install
```sh
wget https://raw.githubusercontent.com/eliasthecactus/cloudfalre_ddns/main/dnsupdate.sh
sudo chmod +x dnsupdate.sh
```

## Config
```sh
1) sudo nano /usr/local/bin/dnsupdate.sh
2) change the variables at the beginning
```

## Usage
```sh
./dnsupdate.sh
```


## 📃 ToDo
- [x] Create Script
- [ ] Create Service


## Author
👤 **elias**
* Instagram: [@eliasthecactus](https://instagram.com/eliasthecactus)
* Github: [@eliasthecactus](https://github.com/eliasthecactus)


## 🤝 Contributing
Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/eliasthecactus/certify/issues).


## Show your support
Give a ⭐️ if this project helped you!


## 📝 License
[Copyright](https://github.com/eliasthecactus/cloudflare_ddns/blob/main/LICENSE) © 2022 [eliasthecactus](https://github.com/eliasthecactus)
