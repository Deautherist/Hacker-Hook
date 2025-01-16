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
        elif
            curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
              | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
              && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
              | sudo tee /etc/apt/sources.list.d/ngrok.list \
              && sudo apt update \
              && sudo apt install ngrok

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
