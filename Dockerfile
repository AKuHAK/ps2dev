FROM alpine:latest

ENV PS2DEV /usr/local/ps2dev
ENV PS2SDK $PS2DEV/ps2sdk
ENV GSKIT  $PS2DEV/gsKit
ENV PATH   $PATH:${PS2DEV}/bin:${PS2DEV}/ee/bin:${PS2DEV}/iop/bin:${PS2DEV}/dvp/bin:${PS2SDK}/bin

COPY . /src

RUN apk add build-base git bash patch wget zlib-dev ucl-dev texinfo
RUN cd /src && ./build-all.sh 1 && ln -sf "$PS2SDK/ee/lib/libc.a" "$PS2DEV/ee/ee/lib/libps2sdkc.a" && ./build-all.sh 2 3 4 5 6

# Second stage of Dockerfile
FROM alpine:latest  

ENV PS2DEV /usr/local/ps2dev
ENV PS2SDK $PS2DEV/ps2sdk
ENV GSKIT $PS2DEV/gsKit
ENV PATH $PATH:${PS2DEV}/bin:${PS2DEV}/ee/bin:${PS2DEV}/iop/bin:${PS2DEV}/dvp/bin:${PS2SDK}/bin

COPY --from=0 ${PS2DEV} ${PS2DEV}
