#! /bin/sh -e
seperator(){
   echo "-------------------------------------------"
}
ask_yes_no(){
   echo "[y or N]:"
   while true; do
      read -r yn
      if [ "$yn" = "y" ]; then
        "$@"
         break
      else
         echo selected no
         return
      fi
   done
}
get_drivers(){
   echo "please type the name of the driver needed (as shown in refrence)"

}
get_kernel_dir(){
   echo Please give the dir of your kernel source
   seperator
   read -r kernel_dir
}
build_it_bro(){
   echo building...
   make
   # there is no modules so installing them is stupid
   make install
}
hardware_gen(){
   echo generating hardware config...
   seperator
   make localyesconfig
   echo "hardware config generated"
   echo "Do you need any firmware drivers? full list of devices that need it here: https://wiki.debian.org/Firmware"
   ask_yes_no "$(get_drivers)"
}
generate_config(){
   need_initrd=0
   need_lvm=0
   need_dm_crypt=0
   need_wifi=0
   kernel_dir=""
   get_kernel_dir
   cd "$kernel_dir"
   echo "Do you need LVM support?"
   seperator
   ask_yes_no "$(need_lvm=1)"
   seperator
   echo "do you need luks/dmcrypt support"
   seperator
   ask_yes_no "$(need_dm_crypt=1)"
   seperator
   echo "will your root be using a device mapper and/or need an initrd in any way?"
   echo "we WILL NOT generate an initrd for you"
   seperator
   ask_yes_no "$(need_initrd=1)"
   seperator
   rm coffee-config
   cp /etc/roasters/base-config .config
   hardware_gen
   build_it_bro
}

echo "        /~~~~~~~~~~~~~~~~~~~/|";
echo "       /              /######/ / |";
echo "      /              /______/ /  |";
echo "     ========================= /||";
echo "     |_______________________|/ ||";
echo "      |  \****/     \__,,__/    ||";
echo "      |===\**/       __,,__     ||    kernel roasters -- Portland, Oregon";
echo "      |______________\====/%____||";
echo "      |   ___        /~~~~\ %  / |";
echo "     _|  |===|===   /      \%_/  |";
echo "    | |  |###|     |########| | /";
echo "    |____\###/______\######/__|/";
echo "    ~~~~~~~~~~~~~~~~~~~~~~~~~~";
echo
echo
echo "Welcome to kernel roasters!!"
echo "(A Generate a lite kernel config based on your hardware"
seperator
echo "(B Generate a generic kerenel config with added support for your hardware"
seperator
echo "(C Generate a kerenl config via a wizard"

while true; do
   read -r input
   if [ "$input" = "a" ]; then {
      echo selected a
      generate_config
      break
   }
   fi
done
return 0
