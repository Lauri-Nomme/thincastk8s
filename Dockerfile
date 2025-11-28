FROM debian:trixie-slim

WORKDIR /

RUN apt update && \
	DEBIAN_FRONTEND=noninteractive apt install -y \
		libarchive13t64 \
		libboost-filesystem1.83.0 \
		libboost-locale1.83.0 \
		libboost-program-options1.83.0 \
		libboost-thread1.83.0 \
		libc6 \
		libfreeimage3 \
		libgcc-s1 \
		libicu76 \
		liblog4cplus-2.0.5t64 \
		libmaxminddb0 \
		libssl3t64 \
		libstdc++6 \
		libthrift-0.19.0t64 \
		libzip5 \
		zlib1g \
		&& \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

COPY stage0/fs/ /

ENTRYPOINT ["usr/sbin/RDWebServices"]
CMD ["-l", "info", "-a", "none", "-p", "443", "-k", "/etc/ssl/rd.key", "-c", "/etc/ssl/rd.cert"]
