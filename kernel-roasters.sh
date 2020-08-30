#! /bin/sh
function seperator(){
   echo "-------------------------------------------"
}
function download_kerenl_tar(){
   mkdir /usr/src/roasters/tars
   
}
function download_open_kernel(){
   mkdir /usr/src/roasters
   echo Please select version
   seperator
   echo "(A latest rc (BAD idea)"
   seperator
   echo "(B latest stable"
   seperator
   echo "(C LTS 5.4.x"
   seperator
   echo "(D LTS 4.19.x"
   seperator
   echo "(E LTS 4.14.x"
   seperator
   while true; do
      read input
      if [[ $input == "a" ]]; then {
         echo selcted RC version -- may luck be with you
         kernel_url=""
         ver="rc"
         break
      }
      fi
      
      if [[ $input == "b" ]]; then {
         echo selcted stable
         kernel_url=""
         ver="stable"
         break
      }
      fi

      if [[ $input == "c" ]]; then {
         echo selected LTS: 5.4.x
         kernel_url=""
         ver="54"
         break
      }
      fi

      if [[ $input == "d" ]]; then {
         echo selected LTS: 4.19.x
         kernel_url=""
         ver="419"
         break
      }
      fi

      if [[ $input == "e" ]]; then {
         echo selected LTS: 4.14.x
         kernel_url=""
         ver="414"
         break
      }
      fi
done
}
function generate_config(){
   download_open_kernel
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
