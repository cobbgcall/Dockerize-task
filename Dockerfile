#### SIMPLE TASK MANAGER
FROM debian:bullseye-slim
LABEL org.opencontainers.image.title="Task Manager"
LABEL org.opencontainers.image.authors="gcallcloud@gmail.com"
RUN useradd taskUser -ms /bin/bash --home /taskCI

### Install dependencies
RUN apt-get update -y && apt install -y \
    git \
    curl \
    vim
### Clean up
RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
### Install Task
WORKDIR /taskCI

RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d 

### Add task to PATH
USER taskUser
RUN echo 'export PATH=$PATH:/taskCI/bin' >> ~/.bashrc   

CMD ["bash"]