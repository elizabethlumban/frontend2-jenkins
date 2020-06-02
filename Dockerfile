FROM node

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN mkdir /app
WORKDIR /app

COPY package.json /app/
RUN npm install --only=production

COPY assets /app/assets

COPY bin /app/bin

EXPOSE 8000

CMD [ "npm", "start" ]