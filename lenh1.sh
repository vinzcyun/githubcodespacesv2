wget -O bios64.bin "https://github.com/BlankOn/ovmf-blobs/raw/master/bios64.bin" && read -p "Nhập liên kết tải file ISO: " iso_link && wget -O win.iso "$iso_link" && wget -O ngrok.tgz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz" && tar -xf ngrok.tgz && rm -rf ngrok.tgz && read -p "Nhập token ngrok: " ngrok_token && ./ngrok authtoken "$ngrok_token" && clear &&
echo "choose ngrok region" 
echo "us - Mỹ"
echo "eu - Châu Âu (Frankfurt)"
echo "ap - Đông Nam Á (Singapore)"
echo "au - Úc (Sydney)"
echo "sa - Nam Mỹ (Sao Paulo)"
echo "jp - Nhật Bản (Tokyo)"
echo "in - Ấn Độ (Mumbai)"
read -p "choose ngrok region: " CRP
./ngrok tcp --region $CRP 5900 &>/dev/null &
clear
