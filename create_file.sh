#!/bin/bash

create_main_c (){
  echo "#include <stdlib.h>"                     > $1
  echo "#include <stdio.h>"                     >> $1
  echo ""                                       >> $1
  echo "#include \"$file.h\""                   >> $1
  echo ""                                       >> $1
  echo "int main(int argc, char const *argv[])" >> $1
  echo "{"                                      >> $1
  echo "  /* code */"                           >> $1
  echo "  return 0;"                            >> $1
  echo "}"                                      >> $1
}

create_file_c (){
  file_c=$1'.c'
  file_h=$1'.h'

  echo "#include \"$file_h\"" > $file_c
}

create_file_h (){
  file_h=$1'.h'
  echo "// Librairy $file_h" > $file_h
}

create_makefile (){
  echo "mem_check: compile"                     > makefile
  echo -e "\tvalgrind ./main"                  >> makefile
  echo ""                                      >> makefile
  echo "run: compile"                          >> makefile
  echo -e "\t./main"                           >> makefile
  echo ""                                      >> makefile
  echo "compile: main.o $1.o"                  >> makefile
  echo -e "\tgcc -Wall -g main.o $1.o -o main" >> makefile
  echo ""                                      >> makefile
  echo "main.o: main.c"                        >> makefile
  echo -e "\tgcc -Wall -g -c main.c"           >> makefile
  echo ""                                      >> makefile
  echo "$1.o: $1.c $1.h"                       >> makefile
  echo -e "\tgcc -Wall -g -c $1.c $1.h"        >> makefile
  echo ""                                      >> makefile
  echo "clean:"                                >> makefile
  echo -e "\trm -f *.o"                        >> makefile
  echo -e "\trm -f main"                       >> makefile
  echo -e "\tls"                               >> makefile
}

# $1 main  $2 file.c  $3 file.h   $4 makefile  $5 path
open_file() {
  sublime "$5/$1" "$5/$2" "$5/$3" "$5/$4"
}
# $1 main  $2 file.c  $3 file.h   $4 makefile  $5 path
move (){
  mv $1 $2 $3 $4 $5
}

# Main #
read -p 'name of file (without .c) = ? ' file
read -p 'subject = ? '  subject
read -p 'path = ? '  next_path

sub_path="/home/user/cours/"
case $subject in
  "BI423")
    subject="BI423/"
    ;;
  "IN404")
    subject="IN404_prog_oriente_obj/"
    ;;
  "IN405")
    subject="IN405_System_Exploitation/"
    ;;
  "IN403")
    subject="IN403_algo_des_graphes/"
    ;;
  *)
    echo "subject failed."
    ;;
esac
path=$sub_path$subject$next_path

create_file_c $file
create_file_h $file
create_main_c main.c $file
create_makefile $file

move main.c "$file.c" "$file.h" makefile $path
open_file main.c "$file.c" "$file.h" makefile $path
