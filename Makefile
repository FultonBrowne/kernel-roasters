export PREFIX ?= "/usr"
all:
	@echo type make install to install
install:
	echo installing
	mkdir -p ${DESTDIR}/etc/
	mkdir -p ${DESTDIR}/etc/roasters/
	mkdir -p ${DESTDIR}${PREFIX}/bin/
	cp ./kernel-roasters.sh ${DESTDIR}${PREFIX}/bin/kernel-roaster
	cp ./base-config ${DESTDIR}/etc/roasters/base-config
