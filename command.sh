clear
sudo apt update
clear
echo "Đang kiểm tra kết nối mạng"
sudo apt-get install speedtest-cli
speedtest-cli --simple
sleep 3
echo "Tốc độ ổn định"
sleep 4
clear
echo "Đã kiểm tra xong, sẽ quay trở lại sau: 5"
sleep 1
clear
echo "Đã kiểm tra xong, sẽ quay trở lại sau: 4"
sleep 1
clear
echo "Đã kiểm tra xong, sẽ quay trở lại sau: 3"
sleep 1
clear
echo "Đã kiểm tra xong, sẽ quay trở lại sau: 2"
sleep 1
clear
echo "Đã kiểm tra xong, sẽ quay trở lại sau: 1"
sleep 1
clear
echo "Đã kiểm tra xong, sẽ quay trở lại sau: 0"
clear
wget -O bios64.bin "https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin"
clear
read -p "Nhập liên kết tải file ISO: " iso_link && wget -O link.iso "$iso_link"
clear
wget -O ngrok.tgz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz" && tar -xf ngrok.tgz && rm -rf ngrok.tgz
read -p "Nhập token ngrok: " ngrok_token && ./ngrok authtoken "$ngrok_token"
clear
echo "Vui lòng chọn khu vực" 
echo "us - Mỹ (Ohio)"
echo "eu - Châu Âu (Frankfurt)"
echo "ap - Đông Nam Á (Singapore)"
echo "au - Úc (Sydney)"
echo "sa - Nam Mỹ (Sao Paulo)"
echo "jp - Nhật Bản (Tokyo)"
echo "in - Ấn Độ (Mumbai)"
read -p "Nhập khu vực: " khuvuc
./ngrok tcp --region $khuvuc 5900 &>/dev/null &
clear
sudo apt update
sudo apt install qemu-kvm -y
read -p "Nhập dung lượng ổ đĩa: " disk_size
qemu-img create -f raw win.img "$disk_size"
clear
sudo qemu-system-x86_64 -m 12G -cpu host -boot order=c -drive file=link.iso,media=cdrom -drive file=win.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin && clear &&
echo "Thành công"
echo "Vui lòng lên Ngrok để lấy địa chỉ IP"
echo "Khu vực dưới này dành cho việc ghi lại báo cáo hoạt động trên RDP"
echo "-----------------------------------"
