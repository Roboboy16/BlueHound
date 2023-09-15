FROM debian:12 as install
ENV NEO4J_PASS=qwerty12345678
ENV BH_USER=bloodhound
EXPOSE 7474/tcp
EXPOSE 7687/tcp
EXPOSE 3000/tcp
WORKDIR /bluehound
SHELL ["/bin/bash", "-c"]
COPY . /bluehound
RUN useradd -m $BH_USER
RUN chmod +x startup.sh
RUN chmod +x endless.sh
RUN ["./startup.sh"]

FROM install
CMD ["./endless.sh"]

