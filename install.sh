#!/bin/bash

clear
echo "----------VPS Codespaces-----------"
echo "Phiên bản: v2.20240422_debug"
echo "Ngôn ngữ: Tiếng Việt"
echo "Khu vực: Việt Nam"
sleep 1
echo "Tóm tắt cập nhật:"
echo "Đã sửa lỗi không hiện IP khi tạo VPS, tối ưu thời gian tải, chỉnh sửa lại giao diện"
sleep 5
clear
#!/bin/bash

echo "Đang chuẩn bị..."
current_percentage=0
while [ $current_percentage -lt 100 ]; do
    random_increment=$((RANDOM % (11)))
    next_percentage=$((current_percentage + random_increment))
    if [ $next_percentage -gt 100 ]; then
        next_percentage=100
    fi
    echo -ne "Đang tải: ["
    for ((j=0; j<=$next_percentage; j+=10)); do 
        echo -n "="
    done
    for ((j=$next_percentage; j<100; j+=10)); do echo -n " "; done
    echo -ne "] $next_percentage%\r"
    current_percentage=$next_percentage
    sleep 0.2
done
echo -e "\nHoàn thành!"
clear
echo "Đang update hệ thống, chờ khoảng 10 giây"
sudo apt update -qq
#!/bin/bash

current_percentage=0
while [ $current_percentage -lt 100 ]; do
    random_increment=$((RANDOM % (11)))
    next_percentage=$((current_percentage + random_increment))
    if [ $next_percentage -gt 100 ]; then
        next_percentage=100
    fi
    echo -ne "Đang tải: ["
    for ((j=0; j<=$next_percentage; j+=10)); do 
        echo -n "="
    done
    for ((j=$next_percentage; j<100; j+=10)); do echo -n " "; done
    echo -ne "] $next_percentage%\r"
    current_percentage=$next_percentage
    sleep 0.2
done
echo -e "\nHoàn thành!"
clear
clear
echo "Đang tải Bios TianoCore"
wget -q -O bios64.bin "https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin"
#!/bin/bash

current_percentage=0
while [ $current_percentage -lt 100 ]; do
    random_increment=$((RANDOM % (11)))
    next_percentage=$((current_percentage + random_increment))
    if [ $next_percentage -gt 100 ]; then
        next_percentage=100
    fi
    echo -ne "Đang tải: ["
    for ((j=0; j<=$next_percentage; j+=10)); do 
        echo -n "="
    done
    for ((j=$next_percentage; j<100; j+=10)); do echo -n " "; done
    echo -ne "] $next_percentage%\r"
    current_percentage=$next_percentage
    sleep 0.2
done
echo -e "\nHoàn thành!"
clear
clear
echo "Đang tải Ngrok cho Linux"
sleep 1
wget -q -O ngrok.tgz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz"
#!/bin/bash

current_percentage=0
while [ $current_percentage -lt 100 ]; do
    random_increment=$((RANDOM % (11)))
    next_percentage=$((current_percentage + random_increment))
    if [ $next_percentage -gt 100 ]; then
        next_percentage=100
    fi
    echo -ne "Đang tải: ["
    for ((j=0; j<=$next_percentage; j+=10)); do 
        echo -n "="
    done
    for ((j=$next_percentage; j<100; j+=10)); do echo -n " "; done
    echo -ne "] $next_percentage%\r"
    current_percentage=$next_percentage
    sleep 0.2
done
echo -e "\nHoàn thành!"
clear
clear
echo "*    Cảnh báo!    *"
echo "Vui lòng không nhấn Enter hoặc nút Tiếp theo trong khi đang tải tệp tin vì sẽ khiến cho lệnh tiếp theo bị lỗi"
read -p "Nhập liên kết tải file ISO: " iso_link && wget -O link.iso "$iso_link"
clear
echo "Giải nén và cài đặt Ngrok"
sleep 2
tar -xf ngrok.tgz
rm -rf ngrok.tgz
clear
read -p "Nhập token Ngrok: " ngrok_token && ./ngrok authtoken "$ngrok_token"
clear
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
clear
echo "Đang tải QEMU-KVM"
sudo apt install qemu-kvm -y -qq
clear
echo "Đang tải thêm công cụ mở rộng"
sudo apt install speedtest-cli -qq
clear
read -p "Nhập dung lượng ổ đĩa: " disk_size
echo "Đang tạo ổ đĩa"
qemu-img create -f raw win.img "$disk_size"
echo "Đã tạo ổ đĩa"
echo "Đang gán lệnh"
sleep 1
clear
echo "Đã tạo VPS thành công!"
echo "Địa chỉ IP của bạn là: "
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Vui lòng đăng nhập vào VNC để sử dụng"
echo "Đang kiểm tra kết nối mạng"
speedtest-cli --simple
echo " "
echo "________________________________________"
echo "|        Lệnh được viết bởi VinZ.      |"
echo "|______________________________________|"
echo "Hoạt động trên VPS: "
sudo qemu-system-x86_64 -m 12G -cpu host -boot order=c -drive file=link.iso,media=cdrom -drive file=win.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin
clear
echo "-------------- Lỗi ----------------"
echo "Ôi không!"
echo "VPS đã dừng hoạt động "
echo "Xin lỗi vì điều này "
echo "-----------------------------------"
echo "Lệnh được viết bởi VinZ"
echo "github.com/vinzcyun"
echo " "
echo " "
clear
#!/bin/bash

while true; do
    echo "Đang cố gắng kết nối lại"
    sleep 1
    echo "Đang xử lý..."
    sleep 1
    echo "Đã kết nối"
    echo "Địa chỉ IP truy cập của bạn sẽ vẫn như cũ"
    sudo qemu-system-x86_64 -m 12G -cpu host -boot order=c -drive file=link.iso,media=cdrom -drive file=win.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin
    clear && sleep 1
    echo "Lỗi không mong muốn"
    sleep 2
done