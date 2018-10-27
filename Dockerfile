FROM alpine:3.5

RUN mkdir -p /opt && apk add --no-cache --update openjdk8-jre curl unzip \
    && curl https://dl.google.com/closure-compiler/compiler-latest.zip >> /tmp/cc.zip \
    && unzip -d /tmp /tmp/cc.zip c*.jar \
    && cp /tmp/c*.jar /opt/closure-compiler.jar \
    && rm /tmp/c*.jar \
    && chmod 0444 /opt/closure-compiler.jar
LABEL io.whalebrew.name closurecc
ENTRYPOINT ["/usr/bin/java", "-jar", "/opt/closure-compiler.jar"]