FROM alpine:3.10
MAINTAINER Andy_f<rg_fan@163.com>
ENV LANG=C.UTF-8
RUN echo http://mirrors.ustc.edu.cn/alpine/v3.9/main > /etc/apk/repositories && \
	echo http://mirrors.ustc.edu.cn/alpine/v3.9/community >> /etc/apk/repositories &&\
	apk --no-cache add ca-certificates && \
	wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk && \
	apk add glibc-2.29-r0.apk && \
	rm -rf glibc-2.29-r0.apk && \
	apk add tzdata && \
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	apk del tzdata && \
	apk add curl
