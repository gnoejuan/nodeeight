FROM eclipse/stack-base:debian

RUN sudo apt-get update && \
    sudo apt-get -y install build-essential libkrb5-dev gcc make ruby-full rubygems debian-keyring python2.7 && \
    sudo gem install —no-rdoc —no-ri sass:3.4.22 && \
    sudo gem install —no-rdoc —no-ri compass && \
    sudo apt-get clean && \
    sudo apt-get -y autoremove && \
    sudo apt-get -y clean && \
    sudo rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN sudo apt update && sudo apt -y install nodejs
RUN sudo apt-get install -y build-essential

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt update && sudo apt -y install yarn

EXPOSE 1337 3000 4200 5000 9000 8003

RUN sudo npm i --unsafe-perm -g pug-cli diff2html live-server npm-gui npm-home npmvet cost-of-modules bower-browser mocha mocha-cli mochawesome speedtest-net puppeteer webpack

LABEL che:server:8003:ref=angular che:server:8003:protocol=http che:server:3000:ref=node-3000 che:server:3000:protocol=http che:server:9000:ref=node-9000 che:server:9000:protocol=http