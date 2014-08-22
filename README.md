# clustard

Clustering Websocket servers in Elixir using Docker

## Running

```bash
boot2docker up
```

```bash
docker build -t websockets_elixir .

docker run -ti -P -p 80:80 --name websockets_elixir websockets_elixir
```
