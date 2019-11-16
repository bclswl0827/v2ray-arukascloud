FROM alpine:3.5
ENV UUID=ad806487-2d26-4636-98b6-ab85cc8521f7
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT /configure.sh
EXPOSE 80
