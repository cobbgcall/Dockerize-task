#### SIMPLE TASK MANAGER
FROM debian:latest
LABEL org.opencontainers.image.authors="gcallcloud@gmail.com"
RUN useradd taskUser

RUN apt-get update -y && apt install -y \
    git \
    curl \
    vim
    
RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d 
RUN mkdir taskCI
RUN chown taskUser:taskUser taskCI
WORKDIR /taskCI
USER taskUser

CMD ["bash"]