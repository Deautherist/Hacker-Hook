#!/bin/bash

BGreen='\033[1;32m'       # Green
BRed='\033[1;31m'         # Red

if [[ -e ngrok ]]; then
    echo ""
else
    printf "${BGreen} Detecting supported NGROK on system.\n"
    arch=$(uname -a | grep -o 'arm' | head -n1)
    arch2=$(uname -a | grep -o 'Android' | head -n1)
    if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
        curl -LO https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
        if [[ -e ngrok-stable-linux-arm.zip ]]; then
            unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
            chmod +x ngrok
            rm -rf ngrok-stable-linux-arm.zip
        else
            printf "${BRed}Error System cannot detect, ${BGreen}install NGROK manually\n"
            printf "${BGreen}from this site: https://download.ngrok.com/linux\n"
            exit 1
        fi
    else
        printf "${BGreen} 32bit system Detected.\n"
        curl -LO https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1
    if [[ -e ngrok-stable-linux-386.zip ]]; then
        unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
        chmod +x ngrok
        rm -rf ngrok-stable-linux-386.zip
    else
        printf "${BRed}Error System cannot detect, ${BGreen}install NGROK manually\n"
        printf "${BGreen}from this site: https://download.ngrok.com/linux\n"
        exit 1
    fi
    fi
fi