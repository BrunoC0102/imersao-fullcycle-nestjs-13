FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

COPY .env.prod .env

COPY prisma ./prisma/

RUN npm install

COPY . .

RUN npx prisma generate

RUN npm run build

CMD [ "npm", "run", "start:prod" ]