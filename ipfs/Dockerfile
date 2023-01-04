FROM ubuntu:latest
RUN apt-get update \
  && apt-get install -y software-properties-common wget jq \
  && rm -rf /var/lib/apt/lists/*
RUN wget https://dist.ipfs.tech/kubo/v0.17.0/kubo_v0.17.0_linux-amd64.tar.gz
RUN tar -xvzf kubo_v0.17.0_linux-amd64.tar.gz
RUN sh kubo/install.sh
RUN ipfs init
RUN jq '. + {"Peering": {"Peers": [{"ID": "QmcFf2FH3CEgTNHeMRGhN7HNHU1EXAxoEk6EFuSyXCsvRE", "Addrs": ["/dnsaddr/node-1.ingress.cloudflare-ipfs.com"]}, {"ID": "QmcFmLd5ySfk2WZuJ1mfSWLDjdmHZq7rSAua4GoeSQfs1z", "Addrs": ["/dnsaddr/node-2.ingress.cloudflare-ipfs.com"]}, {"ID": "QmWaik1eJcGHq1ybTWe7sezRfqKNcDRNkeBaLnGwQJz1Cj", "Addrs": ["/dnsaddr/fra1-1.hostnodes.pinata.cloud"]}]}}' ~/.ipfs/config > tmp.json \
  && mv tmp.json ~/.ipfs/config
RUN jq '.Addresses.API = "/ip4/0.0.0.0/tcp/5001" | .Addresses.Gateway = "/ip4/0.0.0.0/tcp/8080"' ~/.ipfs/config > tmp.json \
  && mv tmp.json ~/.ipfs/config
RUN jq '.API.HTTPHeaders = {"Access-Control-Allow-Origin": ["*"], "Access-Control-Allow-Methods": ["PUT", "POST"]}' ~/.ipfs/config > tmp.json \
  && mv tmp.json ~/.ipfs/config
EXPOSE 4001
EXPOSE 5001
ENTRYPOINT ["ipfs", "daemon"]
