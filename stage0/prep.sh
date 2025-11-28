curl https://packages.thincast.com/deb/install.sh > install.sh
# patch version whitelist

apt download --allow-unauthenticated rdwebservices
dpkg-deb -x rdwebservices_*.deb stage0/fs/
