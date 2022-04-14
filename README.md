# Run OpenSourcePhysics tracker in Docker container

[Tracker github repository](https://github.com/OpenSourcePhysics/tracker)

## Usage

### Clone repository 

```console
git clone https://github.com/maxmorozoff/physlets-tracker.git && \
cd physlets-tracker
```

### Install Docker

```console
make install-docker
```

or

```console
sudo ./install-docker.sh
```

### Build Docker image

```console
make build-image
```

or

```console
sudo ./physlets-tracker-install.sh build
```

### Run Tracker in Docker

```console
make run
```

or

```console
sudo ./physlets-tracker-install.sh
```
