dpkg-deb -I rdwebservices_*.deb | grep Depends | sed 's/Depends: //' | tr ',' '\n' | sed 's/ *(.*//g' | sed 's/^ *//'  | egrep -v 'adduser|rdwebservices-cli|ssl-cert' | paste -sd' ' 
