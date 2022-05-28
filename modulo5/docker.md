
# Instalacion docker 

<br>

## Actualizamos el indice de paquetes e instalamos paquetes para permitir repositorios https

<br>

```bash
 sudo apt-get update
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

## Agregamos la clave GPG oficial de Docker

<br>
 
 ```bash
 sudo mkdir -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

## Configuramos el repositorio

<br>

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

## Instalamos docker

<br>

```bash
 sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```


## Version de docker

<br>

```bash 
docker version
```
```
docker version
Client: Docker Engine - Community
 Version:           20.10.14
 API version:       1.41
 Go version:        go1.16.15
 Git commit:        a224086
 Built:             Thu Mar 24 01:48:02 2022
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true

Server: Docker Engine - Community
 Engine:
  Version:          20.10.14
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.16.15
  Git commit:       87a90dc
  Built:            Thu Mar 24 01:45:53 2022
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.5.11
  GitCommit:        3df54a852345ae127d1fa3092b95168e4a88e2f8
 runc:
  Version:          1.0.3
  GitCommit:        v1.0.3-0-gf46b6ba
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

## Info cliente servidor 

<br>

```bash
docker info
```

```
Client:
 Context:    default
 Debug Mode: false
 Plugins:
  app: Docker App (Docker Inc., v0.9.1-beta3)
  buildx: Docker Buildx (Docker Inc., v0.8.1-docker)
  scan: Docker Scan (Docker Inc., v0.17.0)

Server:
 Containers: 7
  Running: 2
  Paused: 0
  Stopped: 5
 Images: 70
 Server Version: 20.10.14
 Storage Driver: overlay2
  Backing Filesystem: extfs
  Supports d_type: true
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: systemd
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 io.containerd.runtime.v1.linux runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 3df54a852345ae127d1fa3092b95168e4a88e2f8
 runc version: v1.0.3-0-gf46b6ba
 init version: de40ad0
 Security Options:
  apparmor
  seccomp
   Profile: default
  cgroupns
 Kernel Version: 5.15.0-33-generic
 Operating System: Ubuntu 22.04 LTS
 OSType: linux
 Architecture: x86_64
 CPUs: 8
 Total Memory: 15.48GiB
 Name: Dell
 ID: 5QC7:4HDF:HTH7:VCU4:I3NP:QHZA:WXD4:XBO7:M7Q5:JNYV:OU3U:N5GO
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Registry: https://index.docker.io/v1/
 Labels:
 Experimental: false
 Insecure Registries:
  127.0.0.0/8
 Live Restore Enabled: false
 ```

<br>

## Loguearse en Dockerhub mediante usuario y contraseña

<br>

```bash
docker login -u usuario , luego de esto nos pedira la clave
```
<br>

## Loguearse en Dockerhub mediante un token

<br>

Ingresar a la cuenta de docker hub via browser, ir a la configuracion de la cuenta , menu seguridad  y generar un access token

<br>

![docker](./img/Screenshot%20from%202022-05-28%2010-05-03.png)

<br>

![docker](./img/Screenshot%20from%202022-05-28%2010-06-07.png)

<br>

Una vez obtenido el token , nos logueamos desde la consola con el siguiente comando

<br>

```bash
docker login -u fcambres

Luego nos pedira la password y en ese caso insertamos el token que generamos.
```

<br>

Como resultado obtenemos esta salida de pantalla:

<br>

![docker](./img/Screenshot%20from%202022-05-28%2010-08-28.png)




## Cerrar la sesion de la cuenta 

<br>

```bash
docker logout
```

> IMPORTANTE: Tener en cuenta que al hacer un docker login se genera un archivo en el home del usuario .docker/config.json con la clave y no esta encryptada, lo ideal es configurar credential-store.
>
> [Configure Credential-store](https://docs.docker.com/engine/reference/commandline/login/#credentials-store)


<br>

## Borrar imagen de docker 

1. Listamos las imagenes de docker instaladas con el comando **docker images**, buscamos la que queremos eleminar y copiamos el **IMAGE ID**

```bash
docker images
``` 
<br>

![docker](./img/Screenshot%20from%202022-05-28%2016-58-43.png)

<br>

2. Luego con el ID que copiamos ejecutamos el siguiente comando **docker rmi [IMAGE ID]** 

<br>

 ```bash
 docker rmi 6f19136cf89d
 ``` 

Como resultado obtenemos la siguiente salida:

![docker](./img/Screenshot%20from%202022-05-28%2017-04-50.png)



## Imagen Hello World!

Primero nos descargamos la ultima version de la  imagen a nuestro equipo 

```bash
docker pull hello-world:latest
```

Luego ejecutamos el contenedor con el siguente comando:

```bash
docker run hello-world:latest
```

Como salida obtenemos lo siguiente: 


```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

```



## Contenedores modo interactivo: nginx & mysql

<br>

Nos descargamos la imagen de nginx 
```bash
docker pull nginx:1.22.0
```

Luego descargamos la imagen de mysql 

```bash 
docker pull mysql:8.0.29
```


Ejecutamos la imagen en modo interactivo

```bash
docker run -it  mysql:8.0.29 /bin/bash
```

```bash
docker run -it nginx:1.22.0 /bin/bash
```


## Contenedor en base a node-bulletin-board

<br>
1. Nos clonamos el repositorio 
<br>

```bash
git clone https://github.com/dockersamples/node-bulletin-board.git
```

2. Dentro del directorio **bulletin-board-app** encontramos un Dockerfile que nos va a servir para hacer un build de la imagen.

```bash
docker build -t "app/nodejsapp" .
```
> docker build es el comando para construir una imagen

> -t es el parametro para poner la etiqueta a esa imagen 

> el . del final hace referencia a que el dockerfile esta en el mismo directorio donde estoy ejecutando el comando, si estuviese en otro parametro se debe poner la ruta

<br>

```bash
docker build -t "app/nodejsapp" .
Sending build context to Docker daemon  45.57kB
Step 1/7 : FROM node:current-slim
current-slim: Pulling from library/node
42c077c10790: Already exists 
1d1b4cabe4ab: Pull complete 
fbe54bf0ded0: Pull complete 
8070aaabcce5: Pull complete 
4d76e2181e59: Pull complete 
Digest: sha256:311d747afd751df0b60711e1b6d247c825d5214afbc06c1fa8eeebd40e8e14e7
Status: Downloaded newer image for node:current-slim
 ---> 2d19bed8d228
Step 2/7 : WORKDIR /usr/src/app
 ---> Running in 22906610ab66
Removing intermediate container 22906610ab66
 ---> 9ca86f1383e9
Step 3/7 : COPY package.json .
 ---> 5cc315288a5f
Step 4/7 : RUN npm install
 ---> Running in 289706b665b7

added 99 packages, and audited 100 packages in 30s

7 packages are looking for funding
  run `npm fund` for details

1 critical severity vulnerability

To address all issues (including breaking changes), run:
  npm audit fix --force

Run `npm audit` for details.
npm notice 
npm notice New minor version of npm available! 8.9.0 -> 8.11.0
npm notice Changelog: <https://github.com/npm/cli/releases/tag/v8.11.0>
npm notice Run `npm install -g npm@8.11.0` to update!
npm notice 
Removing intermediate container 289706b665b7
 ---> 1d8e46b3bbba
Step 5/7 : EXPOSE 8080
 ---> Running in c317d7b39349
Removing intermediate container c317d7b39349
 ---> cf09964087d3
Step 6/7 : CMD [ "npm", "start" ]
 ---> Running in 0843535f9e5f
Removing intermediate container 0843535f9e5f
 ---> e1cc78ab11d8
Step 7/7 : COPY . .
 ---> ca79aa113ee5
Successfully built ca79aa113ee5
Successfully tagged app/nodejsapp:latest
```

La ultima linea indica que la imagen se construyo y esta taggeada con el nombre app/nodejsapp:latest , podemos observarlo listando las imagenes:

```bash
docker images 

REPOSITORY       TAG          IMAGE ID      CREATED        SIZE

app/nodejsapp   latest      ca79aa113ee5   2 minutes ago   264MB
```

Luego para probar esta imagen ejecutamos lo siguiente

```bash
docker run --name nodejs-app -d -p 8080:8080 app/nodejsapp:latest
```
### Parametros:

> --name es el nombre que va a tener ese contenedor

> -d para que se ejecute en background

> -p para especificar que exponga el puerto 8080 del contenedor en el puerto 8080 del host

> por ultimo app/nodejsapp:latest es la imagen que va a usar ese contenedor para correr

<br>

Para verificar que el contenedor funcione, podemos abrir el navegador y pegarle a nuestro localhost en el puerto 8080 y como resultado deberiamos obtener lo siguiente:

<br>

![docker](./img/Screenshot%20from%202022-05-28%2017-59-54.png)