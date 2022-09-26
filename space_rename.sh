#!/bin/sh

usage(){
  command=$1
  printf "$command [OPTION] [INPUT]*\n\n"
  printf "[OPTION]:\n\t[-h]\tShow help.\n\t[-r]\tSearch for file recursively.\n"
  printf "[INPUT]: There are some posible inputs\n\t[File]\tA single file.\n\t[Pattern]\tA pattern matching some files, i.e. team*\n\t[Directory]\tA directory. If not specified the directory is the working directory.\n"
}

# Body

self=`realpath $0`
selffile=`basename $0`
selfname=${selffile%.*}
working_directory=`pwd`

recursively="false"
directory="."

while getopts "hrd:" arg; do
  case $arg in
    h) # Display help.
      usage $selfname
      exit 0
      ;;
    r) # Search for files recursively. 
      recursively="true"
      ;;
    d) # Used when called recursively to specify the directory 
      directory=$OPTARG
      ;;
  esac
done
shift $((OPTIND-1))

for input in "$*"
do
  if [ -d "$input" ]
  then
    if [ "$input" = "." ] 
    then
      for input_self in * 
      do 
        if [ $recursively = "true" ]
        then 
          sh $self -r -d "$directory" "$input_self"
        else 
          sh $self -d "$directory" "$input_self"
        fi
      done
    else
      cd "$1"
      if [ $recursively = "true" ]
      then 
        sh $self -r -d "$directory/$input" .
      else
        sh $self -d "$directory/$input" .
      fi 
      cd "$working_directory"      
    fi
  fi 


  new="${input// /_}"
  if [ "$new" != "$input" ]
  then
    if [ -e "$new" ]
    then
      printf "Warning: Not renaming $directory/$input because $directory/$new already exists.\n"
    else
      printf "$directory/$input -> $directory/$new\n"
      mv "$input" "$new" 
    fi
  fi
done

exit 0
