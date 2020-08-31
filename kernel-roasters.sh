#! /bin/sh
function seperator(){
   echo "-------------------------------------------"
}
function ask_yes_no(){
   echo [y or N]:
   while true; do
      read yn
      if [[ $yn == "y" ]]; then
         $@
         break
      else
         echo selected no
         return
      fi
   done
}
function get_kernel_dir(){
   echo Please give the dir of your kernel source
   seperator
   read kernel_dir
   return $kerenl_dir
}
function build_it_bro(){
   echo building...
}
function hardware_gen {
   echo generating hardware config...
   seperator
   pre_arch=$(lscpu|grep Architecture:)
   arch_array=$pre_arch
   arch=$(echo $pre_arch|rev|cut -f1 -d' '|rev)
   echo cpu arch is: $arch
   current_modules=$(awk '{print $1}' /proc/modules)
   
}
function generate_config(){
   need_initrd=0
   need_lvm=0
   need_dm_crypt=0
   need_wifi=0
   kernel_dir=""
   get_kernel_dir
   cd $kernel_dir
   echo "Do you need LVM support?"
   seperator
   ask_yes_no $(need_lvm=1)
   seperator
   echo do you need luks/dmcrypt support
   seperator
   ask_yes_no $(need_dm_crypt=1)
   seperator
   echo will your root be using a device mapper and/or need an initrd in any way?
   seperator
   ask_yes_no $(need_initrd=1)
   seperator
   hardware_gen
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
   read input
   if [[ $input == "a" ]]; then {
      echo selected a
      generate_config
      break
   }
   fi
done
return 0
