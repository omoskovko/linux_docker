# linux_docker
Linux Docker homework
## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)

## Introduction
This project contains homework assignments related to Docker on Linux. It includes various Docker configurations and scripts to help you get started with Docker on a Linux environment.

## Installation
To set up the project, follow these steps:
1. Clone the repository:
    ```sh
    git clone git@github.com:omoskovko/linux_docker.git
    ```
2. Navigate to the project directory:
    ```sh
    cd linux_docker
    ```
3. Create a bridge network with the following command
    ```sh
    docker network create my-bridge-network
    ```
4. Build the receiver image with the following command:
    ```sh
    docker build -t nc_server -f Dockerfile.server .
    ```
5. Build the sender image with the following command:
    ```sh
    docker build -t nc_client -f Dockerfile.client .
    ```

## Usage
1. Run the receiver image with the following command:
    ```sh
    docker run -it -d --name receiver --network my-bridge-network -p 1234:1234 -v $(pwd):/netcat nc_server
    ```
2. Run the sender image with the following command:
    ```sh
    docker run -it --name sender --network my-bridge-network -e SERVER_HOST=receiver -v $(pwd):/netcat nc_client
    ```
3. Start chatting with receiver. If you will type "hello", reseiver will answer with message "Hi there!", for other text recever will answer "You said: $line" (where $line is your text).