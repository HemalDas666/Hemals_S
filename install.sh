#!/bin/bash

# Set colors for a better-looking menu
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
MAGENTA='\033[1;35m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Function to display cool ASCII banner
show_banner() {
    clear
    echo -e "${CYAN}  _   _ _____ __  __    _    _        ${NC}"
    echo -e "${CYAN} | | | | ____|  \/  |  / \  | |       ${NC}"
    echo -e "${CYAN} | |_| |  _| | |\/| | / _ \ | |       ${NC}"
    echo -e "${CYAN} |  _  | |___| |  | |/ ___ \| |___    ${NC}"
    echo -e "${CYAN} |_| |_|_____|_|  |_/_/   \_\_____|   ${NC}"                        
    echo -e "${MAGENTA}                                   ${NC}"
    echo -e "${PURPLE}╔═══════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║${WHITE}        ✨ HEMAL'S PANEL MANAGER ✨        ${PURPLE}║${NC}"
    echo -e "${PURPLE}║${GREEN}     ╔═══════════════════════════════╗     ${PURPLE}║${NC}"
    echo -e "${PURPLE}║${GREEN}     ║   👑 POWERED BY HEMAL 👑   ║     ${PURPLE}║${NC}"
    echo -e "${PURPLE}║${GREEN}     ║   🚀 THE LEGENDARY DEV 🚀   ║     ${PURPLE}║${NC}"
    echo -e "${PURPLE}║${GREEN}     ╚═══════════════════════════════╝     ${PURPLE}║${NC}"
    echo -e "${PURPLE}╚═══════════════════════════════════════════════╝${NC}"
    echo ""
}

# Function to install the panel
install_panel() {
    show_banner
    echo -e "\n${CYAN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║   🔧 INSTALLING PANEL - HEMAL EDITION   ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════╝${NC}"
    echo -e "\n${YELLOW}[+] Installing dependencies... Please wait...${NC}"
    
    # Update system package index
    sudo apt update
    
    # Install curl
    sudo apt install curl -y
    
    # Setup and install Node.js 20.x
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs 
    
    # Install PM2 globally
    sudo npm install -g pm2

    echo -e "\n${CYAN}[+] Downloading and setting up the Hemal Panel...${NC}"
    
    # Check if the Jtg folder already exists
    if [ -d "Jtg" ]; then
        echo -e "${YELLOW}[!] The 'Jtg' folder already exists. Please delete it first or use the update option (Option 2).${NC}"
        return
    fi

    # Clone from GitHub
    git clone https://github.com/JishnuTheGamer/Jtg
    
    # Navigate into the directory
    cd Jtg || { echo -e "${RED}[!] Failed to enter the directory!${NC}"; return; }
    
    # Install node modules
    npm i 
    
    # Create user and build
    npm run createuser
    npm run build
    
    # Start with PM2
    pm2 start ecosystem.config.cjs
    
    echo -e "\n${GREEN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║     ✅ PANEL INSTALLED SUCCESSFULLY!         ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
    echo -e "${MAGENTA}╔════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}║       🏆 CREDITS & TRIBUTE 🏆           ║${NC}"
    echo -e "${MAGENTA}╠════════════════════════════════════════════╣${NC}"
    echo -e "${MAGENTA}║${YELLOW}                                    ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${WHITE}         ╔═══════════════════════╗     ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${WHITE}         ║   🌟 HEMAL 🌟        ║     ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${WHITE}         ║  THE ULTIMATE DEV    ║     ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${WHITE}         ║  THE LEGENDARY ONE   ║     ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${WHITE}         ╚═══════════════════════╝     ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${YELLOW}                                    ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${GREEN}      ✨ PANEL STATUS: ONLINE ✨      ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}╚════════════════════════════════════════════╝${NC}"
    echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║   💎 DEVELOPED WITH ❤️ BY HEMAL 💎      ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════╝${NC}"
    
    # Return to the main directory
    cd ..
}

# Function to update the panel
update_panel() {
    show_banner
    echo -e "\n${CYAN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║   🔄 UPDATING PANEL - HEMAL EDITION    ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════╝${NC}"
    
    # Check if the Jtg folder exists
    if [ -d "Jtg" ]; then
        cd Jtg || { echo -e "${RED}[!] Failed to enter the directory!${NC}"; return; }
        
        # Fetch new updates from GitHub
        git stash
        git pull
        
        # Update packages and rebuild
        npm i 
        npm run build 
        
        # Restart PM2 processes
        pm2 restart all
        
        echo -e "\n${GREEN}╔════════════════════════════════════════════╗${NC}"
        echo -e "${GREEN}║     ✅ PANEL UPDATED SUCCESSFULLY!      ║${NC}"
        echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
        echo -e "${MAGENTA}╔════════════════════════════════════════════╗${NC}"
        echo -e "${MAGENTA}║      🙏 UPDATED WITH HONOR FOR HEMAL 🙏  ║${NC}"
        echo -e "${MAGENTA}╚════════════════════════════════════════════╝${NC}"
        
        # Return to the main directory
        cd ..
    else
        echo -e "${RED}[!] 'Jtg' directory not found! Please install the panel first (Option 1).${NC}"
    fi
}

# Main menu loop
while true; do
    show_banner
    echo -e "${YELLOW}╔════════════════════════════════════════════╗${NC}"
    echo -e "${YELLOW}║         📋 MAIN MENU OPTIONS             ║${NC}"
    echo -e "${YELLOW}╠════════════════════════════════════════════╣${NC}"
    echo -e "${YELLOW}║${GREEN}  [1]${NC} Install Panel (Auto Setup)        ${YELLOW}║${NC}"
    echo -e "${YELLOW}║${GREEN}  [2]${NC} Update Panel                     ${YELLOW}║${NC}"
    echo -e "${YELLOW}║${RED}  [3]${NC} Exit                            ${YELLOW}║${NC}"
    echo -e "${YELLOW}╚════════════════════════════════════════════╝${NC}"
    echo -e "${PURPLE}╔════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║${WHITE}      ╔════════════════════════════╗     ${PURPLE}║${NC}"
    echo -e "${PURPLE}║${WHITE}      ║  🌟 HEMAL'S EDITION 🌟   ║     ${PURPLE}║${NC}"
    echo -e "${PURPLE}║${WHITE}      ║  💪 POWERED BY HEMAL 💪  ║     ${PURPLE}║${NC}"
    echo -e "${PURPLE}║${WHITE}      ╚════════════════════════════╝     ${PURPLE}║${NC}"
    echo -e "${PURPLE}╚════════════════════════════════════════════╝${NC}"
    
    read -p "$(echo -e ${CYAN}"Choose an option (1/2/3): "${NC})" choice

    case $choice in
        1)
            install_panel
            ;;
        2)
            update_panel
            ;;
        3)
            show_banner
            echo -e "\n${MAGENTA}╔════════════════════════════════════════════╗${NC}"
            echo -e "${MAGENTA}║${GREEN}   👋 THANK YOU FOR USING HEMAL'S PANEL!  ${MAGENTA}║${NC}"
            echo -e "${MAGENTA}╠════════════════════════════════════════════╣${NC}"
            echo -e "${MAGENTA}║${YELLOW}         ╔═══════════════════════╗       ${MAGENTA}║${NC}"
            echo -e "${MAGENTA}║${YELLOW}         ║  🌟 STAY LEGENDARY! 🌟║       ${MAGENTA}║${NC}"
            echo -e "${MAGENTA}║${YELLOW}         ║  👑 HEMAL THE GREAT 👑║       ${MAGENTA}║${NC}"
            echo -e "${MAGENTA}║${YELLOW}         ╚═══════════════════════╝       ${MAGENTA}║${NC}"
            echo -e "${MAGENTA}╚════════════════════════════════════════════╝${NC}"
            echo -e "${BLUE}           💖 MADE WITH PASSION BY HEMAL 💖${NC}"
            echo -e "\n"
            exit 0
            ;;
        *)
            echo -e "${RED}[!] Invalid option! Please enter 1, 2, or 3.${NC}"
            sleep 2
            ;;
    esac
done
