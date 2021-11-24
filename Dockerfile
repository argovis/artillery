FROM node:16.8.0
WORKDIR /usr/src/artillery
RUN npm install artillery@2.0.0-5 -g
COPY . .
RUN touch /.artilleryrc && chown -R 1000830000:1000830000 /.artilleryrc
RUN chown -R 1000830000:1000830000 /usr/src/artillery
USER 1000830000:1000830000
CMD artillery run demo.yaml
