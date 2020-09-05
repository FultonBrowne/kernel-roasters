all:
	@echo type make install to install
install:
	@echo installing
	 @chmod +x ./fpm
        @mkdir -p ${DESTDIR}/ect/
        @mkdir -p ${DESTDIR}/ect/roasters
        @mkdir -p ${DESTDIR}${PREFIX}/bin/
        @cp ./kernel-roasters.sh ${DESTDIR}${PREFIX}/bin/kernel-roaster
        @cp ./base-config ${DESTDIR}/etc/roasters/base-config
