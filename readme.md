# Pan

**Pan** is the first **MOONBYS.com** public blockchain testnet.

It is a blockchain built with Cosmos SDK, Tendermint and created with [Starport](https://github.com/tendermint/starport).

In this guide you will find how to install the latest binary

***

## Hardware Requirements

These are the minimal hardware configs required for running a validator/sentry node:

* 8GB RAM
* 4vCPUs (8vCPUs is recommended)
* 200GB - 300GB SSD Disk space per year (NVMe disks are recommended)
* 400 Mbit/s bandwidth

> Please avoid cheap VPS providers as a main validator. You could use these as a cheap backup. (We do not recommend these. Use them at your own risk) We advise to use a shared dedicated server or a high-end NVMe VPS.

## Get started

* Make sure that your system is up to date. You should also install a utility named `jq` to read and navigate in JSON files and outputs. 

```
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y build-essential curl wget jq
```
* Increase the default open files limit.
If you don't raise this value, nodes will crash when the network grows large enough.

```
sudo su -c "echo 'fs.file-max = 65536' >> /etc/sysctl.conf"
sudo sysctl -p
```

* Install GoLang
You can find the official instructions at: https://golang.org/doc/install 

1. Remove any old versions that you might have installed in your system
```
apt purge golang-go
apt autoremove

rm -rf /usr/local/go
```
2. Download the software
```
wget -c https://golang.org/dl/go1.17.1.linux-amd64.tar.gz
tar xvf go1.17.1.linux-amd64.tar.gz -C /usr/local
```
3. Update environment variables to include Go
```
cat >> ~/.profile << 'EOF'
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
EOF

source ~/.profile
```
4. Verify that Go was installed correctly:

```
go version
```
You should see `go version go1.17.7 linux/amd64`

## Download and install the latest MOONBYS binary

1. Check the latest version at https://github.com/MOONBYS/pan/releases (If needed, change the command below to the latest version)

```
cd $HOME
wget -nc https://github.com/moonbys/pan/releases/download/v0.2.1/moonbys
chmod +x moonbys
sudo mv moonbys /usr/local/bin/
source ~/.profile
```
2. Confirm that you downloaded the correct version

```
moonbys version
```

You should now have the moonbys binary in your /usr/local/bin/ directory

```
moonbys
```

### Configure

Create a wallet

```
 moonbys keys add YOURWALLETNAME --keyring-backend os
```

This command will generate a new wallet, it will give you an address, a pubkey and a mnemonic phrase.

You will also be asked to create a password.

Make sure that you save your mnemonic phrase in a secure place, never share it with anyone and don't forget your keyring password.

To get some test tokens, scroll down and join the MOONBYS Discord server or the MOONBYS Telegram chat. Ask for some test tokens there.  

### Launch your Node

```
moonbys init YOURNODE
```

You can choose any name that you want for your node. 

Your node's name will be public in the network. 

Delete default genesis file and download the Pan Chain genesis file into ~/.pan/config/

```
cd .pan/config
sudo rm -rf genesis.json
```
```
wget https://moonbys.com/pan-chain/genesis.json
```

Add the published node ID and IP into the configuration file:

```
nano .pan/config/config.toml
```
Find the following line and add the node-id and IP

```
# Comma separated list of nodes to keep persistent connections to
persistent_peers = "3b4085e151b09d360de37c59e0da795df9b52b61@142.132.190.68:26656"
```

Adjust fees 

```
nano .pan/config/app.toml
```

Find the following line and adjust fees (change "0stake" to "0.001upan")

```
# The minimum gas prices a validator is willing to accept for processing a
# transaction. A transaction's fees must meet the minimum of any denomination
# specified in this config (e.g. 0.25token1;0.0001token2).
minimum-gas-prices = "0.001upan"
```

### Start your node:

```
moonbys start
```

***

## Congratulations, you are now part of the MOONBYS.com Pan Blockchain

***

## Setup moonbys systemd service

Make sure that you have stopped the chain with CTRL+C. You can always restart your node with ```moonbys start```. Setting up a systemd will make things simpler, it will keep your node running and it will make it auto-restart.

```
cd $HOME
echo "[Unit]
Description=Moonbys Node
After=network-online.target
[Service]
User=${USER}
ExecStart=$(which moonbys) start
Restart=always
RestartSec=3
LimitNOFILE=4096
[Install]
WantedBy=multi-user.target
" >moonbys.service
```

Enable and activate the MOONBYS service

```
sudo mv moonbys.service /lib/systemd/system/
sudo systemctl enable moonbys.service && sudo systemctl start moonbys.service
```

Check the logs and confirm that the service is working

```
sudo journalctl -u moonbys -f
```

***

## Become a validator in the MOONBYS.com Pan Blockchain

Before setting up your validator node, make sure that you've already gone through the steps above and that your node is caught up with the chain.

You can become a validator with this simple command:

```
moonbys tx staking create-validator --amount="atleast1000000upan" --pubkey="$(moonbys tendermint show-validator)" --moniker="YourMoniker" --chain-id="pan-chain" --commission-rate="0.10" --commission-max-rate="0.20" --commission-max-change-rate="0.01" --min-self-delegation="1" --fees="5000upan" --from="YourKeyName" --keyring-backend="os"
```

You can add the following flags to the previous command:

```
--website="https://your-validator.com" \
--identity=A 16 digit code-key from keybase.io \
--details="Your validator's description and details!" \
```

You can always edit your validator with:

```
moonbys tx staking edit-validator
```


***

To get some test tokens join our Discord server or Telegram chat below.

You should also explore the moonbys binary and the docs below.


***

## Learn more

- [MOONBYS Docs](https://docs.moonbys.com/)
- [MOONBYS Discord](https://discord.gg/yr5vqypJK2)
- [MOONBYS Twitter](https://twitter.com/moonbys_)
- [MOONBYS Telegram Announcements](t.me/moonbys)
- [MOONBYS Telegram Chat](t.me/moonbys_chat)
- [Starport](https://github.com/tendermint/starport)
- [Starport Docs](https://docs.starport.network)
- [Cosmos SDK documentation](https://docs.cosmos.network)
- [Cosmos SDK Tutorials](https://tutorials.cosmos.network)
- [Discord](https://discord.gg/cosmosnetwork)
