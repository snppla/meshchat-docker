# meschat-docker

## Create a aredn meshchat server using docker

## Instructions
Use Jacob's [instructions](http://www.trevorsbench.com/meshchat-messaging-for-mesh-networks/) for installing the API package on your aredn node

## Example of docker run 

docker run --rm  -e "LOCAL_NODE=192.168.50.2" -e "MESH_ZONE=MeshChat" -h kf7ztb.local.mesh -p 9050:80 snppla/meshchat-docker

## Hostname

Set the hostname to match your aredn dns name

## Environment Variables:

### `MESH_ZONE`

Set the zone. By default it is set to MeshChat

### `LOCAL_NODE`
Set the ip address of the aredn node

