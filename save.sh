# this script allows to save in the VME.

#!/bin/bash

doss_cours="LicenceUVSQ/L2Info/S4/"
vme="/media/sf_VME/"

if [ $1 == "man" ]
then
  echo -e "form expected: subject path_doss.\n"
fi

if [ $# -eq 2 ]
then
  case $1 in
    "IN405")
      subject="IN405_System_Exploitation/"
      ;;
    "BI423")
      subject="BI423/"
      ;;
    "IN404")
      subject="IN404_prog_oriente_obj/"
      ;;
    *)
      echo "subject failed."
      ;;
  esac

  dir="$2/"
  copy="$doss_cours$subject$dir"

  if [ -d $copy ]
  then
    echo $copy
    cp -ur $copy $vme
  else
    echo "'$2/' doesn't exist in '$copy'."
  fi

if [ $# -eq 1 ]
then
  cp -ur $1 $vme
fi

else
  if [ $1 != "man" ]
  then
   echo "param number failed."
  fi
fi
