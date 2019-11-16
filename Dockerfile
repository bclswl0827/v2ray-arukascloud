FROM alpine:3.5
ENV UUID=ad806487-2d26-4636-98b6-ab85cc8521f7
ADD run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT /run.sh
EXPOSE 80
