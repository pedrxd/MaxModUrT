FROM debian AS builder

WORKDIR /code/

RUN apt-get update
RUN apt-get install -y gcc make

#Build code
COPY ./ /code/
RUN make -j4

FROM pedrxd/urbanterror

COPY --from=builder /code/build/release-linux-*/urbanterror-server-m9.* /data/UrbanTerror43/urbanterror-server
RUN chmod +x /data/UrbanTerror43/urbanterror-server
