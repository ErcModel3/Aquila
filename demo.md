```
topology:
  nodes:
    my-node:
      image: myimage:latest
      binds:
        - configs/my-node/sshd_config:/config/sshd_config
      env:
        MAX_SESSIONS: 10
      ports:
        - 2201:22
```

So the volume mount pattern still works — `binds` is just Containerlab's syntax for `-v`. Your entrypoint.sh approach carries over cleanly.

---

**What's different**

- **No docker-compose** — the topology file is the source of truth. You organise per-node config in a directory structure that mirrors your topology
- **Networking is managed for you** — Containerlab creates and wires the bridges/links between nodes, so you don't control that the same way you would in Compose
- **Node names are deterministic** — Containerlab names containers `clab-<topology>-<node>`, which matters if your config or entrypoint is hostname-aware
- **Lifecycle is topology-wide** — `clab deploy` and `clab destroy` bring everything up/down together, so partial config failures affect the whole lab

---

**Conventional config layout for Containerlab**

The community pattern is to mirror the topology in your repo:
```
topology.yml
configs/
  node-a/
    sshd_config
  node-b/
    sshd_config