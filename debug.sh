#!/bin/bash

clear
echo "Choose language / Chọn ngôn ngữ:"
echo "1. English"
echo "2. Tiếng Việt"
read -p "Enter your choice / Nhập lựa chọn của bạn: " lang_choice

if [ "$lang_choice" == "1" ]; then
    echo "Loading commands..."
    echo "Updating system, please wait about 30 seconds"
    sudo apt update -qq
    echo "Downloading Speedtest for Linux"
    sudo apt-get install speedtest-cli -qq
    echo "Success!"
    echo "Downloading Bios TianoCore"
    sleep 1
    wget -O bios64.bin "https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin"
    read -p "Enter the ISO file download link: " iso_link && wget -O link.iso "$iso_link"
    echo "Downloading Ngrok for Linux"
    sleep 1
    wget -O ngrok.tgz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz"
    echo "Extracting and installing"
    tar -xf ngrok.tgz
    rm -rf ngrok.tgz
    read -p "Enter Ngrok token: " ngrok_token && ./ngrok authtoken "$ngrok_token"
    echo "Please select a region" 
    echo "us - United States (Ohio)"
    echo "eu - Europe (Frankfurt)"
    echo "ap - Asia Pacific (Singapore)"
    echo "au - Australia (Sydney)"
    echo "sa - South America (Sao Paulo)"
    echo "jp - Japan (Tokyo)"
    echo "in - India (Mumbai)"
    read -p "Enter region: " khuvuc
    ./ngrok tcp --region $khuvuc 5900 &>/dev/null &
    sudo apt update -qq
    sudo apt install qemu-kvm -y -qq
    sudo apt install speedtest-cli -qq
    read -p "Enter disk size: " disk_size
    qemu-img create -f raw win.img "$disk_size"
    echo "Disk created"
    echo "Setting up commands"
    echo "VPS created successfully!"
    echo "Your IP address is: "
    curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
    echo " "
    echo " "
    echo "Checking network connection"
    speedtest-cli
    echo " "
    echo "VPS will be operational for 50 hours"
    echo "________________________________________"
    echo "|        Commands written by VinZ.      |"
    echo "|______________________________________|"
    echo "VPS operations: "
    sudo qemu-system-x86_64 -m 12G -cpu host -boot order=c -drive file=link.iso,media=cdrom -drive file=win.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin
elif [ "$lang_choice" == "2" ]; then
    clear
    echo "Đang tải lệnh..."
    echo "Đang cập nhật hệ thống, vui lòng đợi khoảng 30 giây"
    sudo apt update -qq
    echo "Đang tải Speedtest cho Linux"
    sudo apt-get install speedtest-cli -qq
    echo "Thành công!"
    echo "Đang tải Bios TianoCore"
    sleep 1
    wget -O bios64.bin "https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin"
    read -p "Nhập liên kết tải file ISO: " iso_link && wget -O link.iso "$iso_link"
    echo "Đang tải Ngrok cho Linux"
    sleep 1
    wget -O ngrok.tgz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz"
    echo "Giải nén và cài đặt"
    tar -xf ngrok.tgz
    rm -rf ngrok.tgz
    read -p "Nhập token Ngrok: " ngrok_token && ./ngrok authtoken "$ngrok_token"
    echo "Vui lòng chọn khu vực" 
    echo "us - Hoa Kỳ (Ohio)"
    echo "eu - Châu Âu (Frankfurt)"
    echo "ap - Đông Nam Á (Singapore)"
    echo "au - Úc (Sydney)"
    echo "sa - Nam Mỹ (Sao Paulo)"
    echo "jp - Nhật Bản (Tokyo)"
    echo "in - Ấn Độ (Mumbai)"
    read -p "Nhập khu vực: " khuvuc
    ./ngrok tcp --region $khuvuc 5900 &>/dev/null &
    sudo apt update -qq
    sudo apt install qemu-kvm -y -qq
    sudo apt install speedtest-cli -qq
    read -p "Nhập dung lượng ổ đĩa: " disk_size
    qemu-img create -f raw win.img "$disk_size"
    echo "Đã tạo ổ đĩa"
    echo "Đang gán lệnh"
    echo "Đã tạo VPS thành công!"
    echo "Địa chỉ IP của bạn là: "
    curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
    echo " "
    echo " "
    echo "Đang kiểm tra kết nối mạng"
    speedtest-cli
    echo " "
    echo "VPS sẽ hoạt động được 50h"
    echo "________________________________________"
    echo "|        Lệnh được viết bởi VinZ.      |"
    echo "|______________________________________|"
    echo "Hoạt động trên VPS: "
    sudo qemu-system-x86_64 -m 12G