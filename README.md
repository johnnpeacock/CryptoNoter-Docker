CryptoNoter Docker
==================

Start [CryptoNoter](https://github.com/johnnpeacock/CryptoNoter) in a docker container.

See [README.md](https://github.com/johnnpeacock/CryptoNoter#cryptonoter-in-browser-javascript-web-miner) for more info.


## Environment Variables

** DOMAIN ** defaults to `localhost`

** POOL ** defaults to `ca.minexmr.com`

** ADDR ** (REQUIRED) the XMR or ETN address to send payments

** PASS ** (REQUIRED) the password for CryptoNoter

## Example

```
docker run --rm -it -p 7777:7777 -e ADDR=<xmr wallet> -e PASS=<password> CryptoNoter
```
