## Hello World

This is a mini setup used to build 
[serilog-sinks-file](https://github.com/serilog/serilog-sinks-file) repo with
Jenkins and publish the artifacts to both Jenkins and WebDAV


## Infra design

Setup is described in the [MS Visio chart](./Infra.vsdx). 

Linux Debian host is running Docker containers:
- jenkins master [jenkins/jenkins:lts](https://hub.docker.com/r/jenkins/jenkins)
- jenkins agent 
[artjomaverin0/test_jenkins_agent:latest](https://hub.docker.com/r/artjomaverin0/test_jenkins_agent)
built with [Dockerfile](./docker-compose/image/Dockerfile)
- Apache server with WebDAV 
[bytemark/webdav](https://hub.docker.com/r/bytemark/webdav)


## Starting the infra

This assumes that a host with all required tools has been prepared. If running
from a fresh and empty machine, please refer to the sample instruction of how
to prepare the [Debian host](##setting-up-host) below.

Clone this repo
```
mkdir ~/git && cd ~/git
git clone https://github.com/artjomaverin/serilog-sinks-file-build.git
```

Start the containers
```
cd ~/git/serilog-sinks-file-build/docker-compose/
sudo docker compose up -d --remove-orphans
```


## Accessing the infra
Jenkins master is available at [127.0.0.1:8080](http://127.0.0.1:8080/)
WebDAV is running at [127.0.0.1:80](http://127.0.0.1:80/)


## Setting up host

List of commands for a fresh Debian installation to run this deployment.

First, install Docker following the official 
[docs](https://docs.docker.com/engine/install/debian/#install-using-the-repository).
```
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
	https://download.docker.com/linux/debian $(lsb_release -cs) stable" | \
	sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

Install Git
```
sudo apt-get install -y git
```




