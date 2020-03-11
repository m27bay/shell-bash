#!/bin/bash

create_c (){
  echo "#include <stdlib.h>" > $1
  echo "#include <stdio.h>" >> $1
  echo "" >> $1
  echo "int main(int argc, char const *argv[])" >> $1
  echo "{" >> $1
  echo "  /* code */" >> $1
  echo "  return 0;" >> $1
  echo "}" >> $1
  sublime $1
}

# if the first parameter is "man"
if [ $1 == "man" ]
then
  echo -e "form expected: language file.\n"
fi

# if the number of parameters is more or equal of two
if [ $# -ge 2 ]
  for i in 'seq 2 num_parameter'
  do
    last_char = $i[${#$i} - 1]
    if [ $i  ==   'c' ]
    then
      create_c $i
    fi
  done


# if the first parameters isn't "man"
else
  if [ $1 != "man" ]
  then
   echo "param number failed."
  fi
fi
