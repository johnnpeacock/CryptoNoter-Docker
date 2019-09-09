#!/bin/sh

if [ ! -n "$DOMAIN" ];then
    DOMAIN="localhost"
fi
if [ ! -n "$POOL" ];then
    POOL="ca.minexmr.com:5555"
fi

# ensure ADDR is set
if [ ! -n "$ADDR" ];then
    ADDR="4A8DXj2zKVGVrpwHif5TXPU6znWpvdqWsUnWmtxBTqMaVPBrJ6dCTDJHUPoq82bZoebW5LHJCbiCFRU1prE4MdXjPaEhojb"
    #echo "Environment variable ADDR must be set with your XMR or ETN wallet address!"
    exit 1
fi

# ensure pass is set
if [ ! -n "$PASS" ]; then
    echo "Environment variable PASS must be set with your password!"
    exit 1
fi

sed -i "s/miner.cryptonoter.com/$DOMAIN/g" /srv/CryptoNoter/config.EXAMPLE.json
sed -i "s/127.0.0.1/0.0.0.0/g" /srv/CryptoNoter/config.EXAMPLE.json
sed -i "s/pool.cryptonoter.com:1111/$POOL/g" /srv/CryptoNoter/config.EXAMPLE.json
sed -i "s/INPUT_YOUR_WALLET_ADDRESS/$ADDR/g" /srv/CryptoNoter/config.EXAMPLE.json
sed -i "s/\"pass\": \"\"/\"pass\": \"$PASS\"/g" /srv/CryptoNoter/config.EXAMPLE.json

# copy config
cp /srv/CryptoNoter/config.EXAMPLE.json /srv/CryptoNoter/config.json

exec "$@"
