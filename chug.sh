#!/bin/sh
#
# Github chugger by 0xFED
# 
# v0.1 - It actually did the thing holy shit!
# v0.2 - Shitty colors now available
# v0.3 - Shitty error checking now available
# v0.4 - Finally stopped erroring when running

RED='\033[0;31m'
GREEN='\e[32m'
NC='\033[0m' # No Color


if [ "$1" == "" ];
then
	printf "Github chugger by 0xFED\n"
	printf "run ./chug <GithubUserName>\n"
	exit 1
fi

if [ -d "$1" ];
then
	printf "${RED}That directory already exists maybe try another?\n${NC}"
	exit 2
fi

mkdir $1
printf "${GREEN}Directory $1 created.${NC}\n"
cd $1
printf "${GREEN}Chugging all the things.${NC}\n"
curl -s https://api.github.com/users/$1/repos | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone
cd ..
printf "${GREEN}*BURP*${NC}\n"
