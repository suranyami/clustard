# clustard

Clustering Websocket servers in Elixir using Docker

## Running

```bash
boot2docker up
```

```bash
docker build -t websockets_elixir .

docker run -t -P -p 4000:4000 --name websockets_elixir websockets_elixir
```
