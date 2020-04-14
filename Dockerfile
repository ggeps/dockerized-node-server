FROM node:10

RUN echo "*****---- COPYING APP ----*****"

COPY mes/dist/ /app
COPY mes/package.json /app

RUN apt-get update || true

RUN echo "Working dir change"
WORKDIR /app

RUN echo "Installing app dependencies"
RUN npm i

RUN echo "Installing forever..."
RUN npm i -g forever
EXPOSE 80

CMD [ "forever", "app.js" ]

