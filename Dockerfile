# -----------------------all configuration under the image-------------------------------

# ubuntu image from hub.docker.com
FROM ubuntu
# node js install into ubuntu after ubuntu os
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs
# now the node js codes which we want to run will start copy from local machine to container destination
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY main.js main.js
# to install node modules too 
RUN npm install
# now to run the main file or that file where node js code is being written 
# jab bhi container ko run kre then immediately this following will execute if new then after all installation it will execute
ENTRYPOINT [ "node", "main.js" ]    