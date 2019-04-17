Ethereum Network Intelligence API
============
[![Build Status][travis-image]][travis-url] [![dependency status][dep-image]][dep-url]

This is the backend service which runs along with ethereum and tracks the network status, fetches information through JSON-RPC and connects through WebSockets to [eth-netstats](https://github.com/cubedro/eth-netstats) to feed information. For full install instructions please read the [wiki](https://github.com/ethereum/wiki/wiki/Network-Status).

## Prerequisite
* eth, geth or pyethapp
* node
* npm

## Docker

### Configuration (Environment Variables)

To run the docker container against your client, you can pass in env variables

```
docker run \
    --net host \
    -e RPC_HOST=localhost \
    -e RPC_PORT=8545 \
    -e LISTENING_PORT=30303 \
    -e INSTANCE_NAME=MyLocalMachine \
    -e WS_SERVER=wss://rpc.ethstats.net
    -e WS_SECRET=<secret>
    -it goerli/ethstats-client
```

Alternatively, you can pass in an `--env-file` to Docker with all the above set.

### Configuration (app.json)

You can also overwrite the `app.json` file to pass in configuration, for example:
 
```
docker run \
    -v <path to app.json>:/home/ethnetintel/ethstats-client/app.json \
    -it goerli/ethstats-client
```

## Installation on an Ubuntu EC2 Instance

Fetch and run the build shell. This will install everything you need: latest ethereum - CLI from develop branch (you can choose between eth or geth), node.js, npm & pm2.

```bash
bash <(curl https://raw.githubusercontent.com/cubedro/eth-net-intelligence-api/master/bin/build.sh)
```

## Run Local

Run it using pm2:

```bash
cd ~/bin
pm2 start processes.json
```

## Updating

To update the API client use the following command:

```bash
~/bin/www/bin/update.sh
```

It will stop the current netstats client processes, automatically detect your ethereum implementation and version, update it to the latest develop build, update netstats client and reload the processes.

## Notes

 - For the WS_SECRET, see http://forum.ethereum.org/discussion/2112/how-to-add-yourself-to-the-stats-dashboard-its-not-automatic
 - Ensure that your container has connectivity to your Ethereum client.

[travis-image]: https://travis-ci.org/cubedro/eth-net-intelligence-api.svg
[travis-url]: https://travis-ci.org/cubedro/eth-net-intelligence-api
[dep-image]: https://david-dm.org/cubedro/eth-net-intelligence-api.svg
[dep-url]: https://david-dm.org/cubedro/eth-net-intelligence-api
